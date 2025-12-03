//
//  LoginViewController_Combine.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/3/25.
//

import UIKit

import SnapKit
import Then
import Toast
import Combine

final class LoginViewController_Combine: BaseViewController {

    // MARK: - ViewModel
    
    private let viewModel = LoginViewModel()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Subjects (View → ViewModel)
    
    private let emailSubject = PassthroughSubject<String, Never>()
    private let passwordSubject = PassthroughSubject<String, Never>()
    private let loginTappedSubject = PassthroughSubject<Void, Never>()
    private let secureTappedSubject = PassthroughSubject<Void, Never>()
    private let clearTappedSubject = PassthroughSubject<Void, Never>()

    // MARK: - Properties
    
    var shouldResetFields = false
    
    // MARK: - UI Components (그대로 사용)
    
    private lazy var naviBar = CustomNavigationBar().then {
        $0.setTitle("이메일 또는 아이디로 계속")
    }

    private lazy var emailTextField = makeTextField(
        placeholder: "이메일 또는 아이디를 입력해 주세요"
    )

    private lazy var passwordTextField = makeTextField(
        placeholder: "비밀번호",
        isSecure: true
    )

    private lazy var clearButton = UIButton().then {
        $0.setImage(.clear, for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }

    private lazy var secureButton = UIButton().then {
        $0.setImage(.eyeSlash, for: .normal)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(secureButtonTapped), for: .touchUpInside)
    }

    private let rightView = UIView()

    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .baeminGray200
        $0.titleLabel?.font = .head_b_18
        $0.setTitleColor(.baeminWhite, for: .normal)
        $0.layer.cornerRadius = 4
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }

    private lazy var findAccountButtonView = UIView().then {
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(findAccountButtonDidTap)))
    }

    private let findAccountLabel = UILabel().then {
        $0.font = .body_r_14
        $0.textColor = .baeminBlack
        $0.text = "계정 찾기"
    }

    private let moreImageView = UIImageView().then {
        $0.image = .moreButton
    }

    // MARK: - Lifecycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
    
    override func setUI() {
        super.setUI()

        view.addSubviews(
            naviBar,
            emailTextField,
            passwordTextField,
            rightView,
            loginButton,
            findAccountButtonView
        )

        rightView.addSubviews(clearButton, secureButton)
        findAccountButtonView.addSubviews(findAccountLabel, moreImageView)
    }

    override func setLayout() {
        super.setLayout()

        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }

        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(naviBar.snp.bottom).offset(24)
            $0.height.equalTo(46)
        }

        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.height.equalTo(46)
        }

        rightView.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField).inset(20)
            $0.width.equalTo(56)
            $0.height.equalTo(20)
        }

        secureButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }

        clearButton.snp.makeConstraints {
            $0.trailing.equalTo(secureButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }

        loginButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(46)
        }

        findAccountButtonView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(66)
            $0.height.equalTo(14)
        }

        findAccountLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }

        moreImageView.snp.makeConstraints {
            $0.trailing.centerY.equalToSuperview()
            $0.size.equalTo(12)
        }
    }

    override func setStyle() {
        super.setStyle()
        bindViewModel()
        setDelegate()
    }

    override func setDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    // MARK: - Bind
    
    private func bindViewModel() {

        let input = LoginViewModel.Input(
            emailText: emailSubject.eraseToAnyPublisher(),
            passwordText: passwordSubject.eraseToAnyPublisher(),
            loginTapped: loginTappedSubject.eraseToAnyPublisher(),
            secureTapped: secureTappedSubject.eraseToAnyPublisher(),
            clearTapped: clearTappedSubject.eraseToAnyPublisher()
        )

        let output = viewModel.transform(input)

        // 로그인 버튼 활성화
        output.isLoginEnabled
            .sink { [weak self] enabled in
                self?.loginButton.isEnabled = enabled
                self?.loginButton.backgroundColor = enabled ? .baeminMint500 : .baeminGray200
            }
            .store(in: &cancellables)

        // secureTextEntry 변경
        output.isSecureMode
            .sink { [weak self] secure in
                self?.passwordTextField.isSecureTextEntry = secure
                self?.secureButton.setImage(secure ? .eyeSlash : .eye, for: .normal)
            }
            .store(in: &cancellables)
        
        // clear/secure 버튼 show & hide
        output.shouldShowClearButtons
            .sink { [weak self] show in
                self?.clearButton.isHidden = !show
                self?.secureButton.isHidden = !show
                if !show {
                    self?.passwordTextField.text = ""
                }
            }
            .store(in: &cancellables)

        // 로그인 성공
        output.loginSuccess
            .sink { [weak self] email in
                self?.pushToWelcome(email)
            }
            .store(in: &cancellables)

        // 로그인 에러
        output.loginError
            .sink { [weak self] message in
                self?.view.makeToast(message)
            }
            .store(in: &cancellables)
    }
    
    private func makeTextField( placeholder: String, isSecure: Bool = false ) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.setPlaceholderColor(.baeminGray700)
        textField.font = .body_r_14
        textField.backgroundColor = .baeminWhite
        textField.addLeftPadding(10)
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.textColor = .baeminBlack
        textField.isSecureTextEntry = isSecure
        textField.clearButtonMode = isSecure ? .never : .whileEditing
        return textField
    }
    
    private func resetFields() {
        emailTextField.text = ""
        passwordTextField.text = ""
        passwordTextField.isSecureTextEntry = true
        secureButton.setImage(.eyeSlash, for: .normal)

        emailSubject.send("")
        passwordSubject.send("")
    }

    // MARK: - UI → ViewModel 이벤트 전달
    
    @objc
    private func loginButtonDidTap() {
        loginTappedSubject.send(())
    }

    @objc
    private func secureButtonTapped() {
        secureTappedSubject.send(())
    }

    @objc
    private func clearButtonTapped() {
        clearTappedSubject.send(())
    }

    @objc
    private func findAccountButtonDidTap() {
        print("계정 찾기 버튼")
    }
    
    private func pushToWelcome(_ email: String) {
        let vc = WelcomeViewController_Combine(email: email)
        vc.loginDataCompletion = { [weak self] in
            self?.view.endEditing(true)
            self?.resetFields()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController_Combine: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminBlack.cgColor
        textField.layer.borderWidth = 2
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            emailSubject.send(textField.text ?? "")
        } else {
            passwordSubject.send(textField.text ?? "")
        }
    }
}
