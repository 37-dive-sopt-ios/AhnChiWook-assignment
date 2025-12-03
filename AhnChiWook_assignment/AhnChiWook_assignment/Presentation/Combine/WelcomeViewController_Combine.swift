//
//  WelcomeViewController_Combine.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/3/25.
//

import UIKit

import Combine
import SnapKit
import Then

final class WelcomeViewController_Combine: BaseViewController {

    // MARK: - Properties
    private let viewModel: WelcomeViewModel
    private var cancellables = Set<AnyCancellable>()

    // Input Subjects
    private let backTappedSubject = PassthroughSubject<Void, Never>()

    // Completion
    var loginDataCompletion: (() -> Void)?

    // MARK: - Init
    init(email: String) {
        self.viewModel = WelcomeViewModel(email: email)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // UI
    private lazy var naviBar = CustomNavigationBar().then {
        $0.setTitle("대체 뼈찜 누가 시켰어!!")
    }

    private let welcomeImage = UIImageView().then {
        $0.image = .image21
    }

    private let welcomeLabel = UILabel().then {
        $0.text = "환영합니다"
        $0.font = .head_b_24
        $0.textColor = .baeminBlack
    }

    private let hiLabel = UILabel().then {
        $0.font = .title_sb_18
        $0.textColor = .baeminBlack
    }

    private lazy var backButton = UIButton().then {
        $0.setTitle("뒤로가기", for: .normal)
        $0.backgroundColor = .baeminMint500
        $0.titleLabel?.font = .title_sb_18
        $0.setTitleColor(.baeminWhite, for: .normal)
        $0.layer.cornerRadius = 4
        $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }


    // MARK: - LifeCycle
    override func setStyle() {
        super.setStyle()
        bindViewModel()
    }
    
    override func setUI() {
        view.addSubviews(
            naviBar,
            welcomeImage,
            welcomeLabel,
            hiLabel,
            backButton
        )
    }
    
    override func setLayout() {
        naviBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        welcomeImage.snp.makeConstraints {
            $0.top.equalTo(naviBar.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeImage.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
        }
        
        hiLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }

    private func bindViewModel() {
        let input = WelcomeViewModel.Input(
            backButtonTapped: backTappedSubject.eraseToAnyPublisher()
        )

        let output = viewModel.transform(input)

        // 텍스트 바인딩
        output.welcomeText
            .sink { [weak self] text in
                self?.hiLabel.text = text
            }
            .store(in: &cancellables)

        // pop 이벤트 처리
        output.popEvent
            .sink { [weak self] in
                self?.navigationController?.popViewController(animated: true)
                self?.loginDataCompletion?()
            }
            .store(in: &cancellables)
    }

    @objc
    private func backButtonDidTap() {
        backTappedSubject.send(())
    }
}
