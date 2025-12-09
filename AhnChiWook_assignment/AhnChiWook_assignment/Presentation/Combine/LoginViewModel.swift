//
//  LoginViewModel.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/3/25.
//

import UIKit

import Combine

final class LoginViewModel {

    // MARK: - Input
    
    struct Input {
        let emailText: AnyPublisher<String, Never>
        let passwordText: AnyPublisher<String, Never>
        let loginTapped: AnyPublisher<Void, Never>
        let secureTapped: AnyPublisher<Void, Never>
        let clearTapped: AnyPublisher<Void, Never>
    }

    // MARK: - Output
    
    struct Output {
        let isLoginEnabled: AnyPublisher<Bool, Never>
        let isSecureMode: AnyPublisher<Bool, Never>
        let shouldShowClearButtons: AnyPublisher<Bool, Never>
        let loginSuccess: AnyPublisher<String, Never>
        let loginError: AnyPublisher<String, Never>
    }

    // MARK: - Subjects
    
    private let emailSubject = CurrentValueSubject<String, Never>("")
    private let passwordSubject = CurrentValueSubject<String, Never>("")
    private let isSecureSubject = CurrentValueSubject<Bool, Never>(true)

    private let loginSuccessSubject = PassthroughSubject<String, Never>()
    private let loginErrorSubject = PassthroughSubject<String, Never>()

    private var cancellables = Set<AnyCancellable>()

    func transform(_ input: Input) -> Output {

        input.emailText
            .sink { [weak self] in self?.emailSubject.send($0) }
            .store(in: &cancellables)

        input.passwordText
            .sink { [weak self] in self?.passwordSubject.send($0) }
            .store(in: &cancellables)

        input.secureTapped
            .sink { [weak self] in
                guard let self else { return }
                self.isSecureSubject.send(!self.isSecureSubject.value)
            }
            .store(in: &cancellables)

        input.clearTapped
            .sink { [weak self] in
                self?.passwordSubject.send("")
            }
            .store(in: &cancellables)

        input.loginTapped
            .sink { [weak self] in
                self?.validateLogin()
            }
            .store(in: &cancellables)

        let isLoginEnabled = Publishers.CombineLatest(emailSubject, passwordSubject)
            .map { !$0.isEmpty && !$1.isEmpty }
            .eraseToAnyPublisher()

        let shouldShowClear = passwordSubject
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()

        return Output(
            isLoginEnabled: isLoginEnabled,
            isSecureMode: isSecureSubject.eraseToAnyPublisher(),
            shouldShowClearButtons: shouldShowClear,
            loginSuccess: loginSuccessSubject.eraseToAnyPublisher(),
            loginError: loginErrorSubject.eraseToAnyPublisher()
        )
    }

    private func validateLogin() {
        let email = emailSubject.value
        let password = passwordSubject.value

        if !email.isValidEmail {
            loginErrorSubject.send("이메일 형식이 달라요")
            return
        }
        if !password.isValidPassword {
            loginErrorSubject.send("비밀번호 형식이 달라요")
            return
        }

        loginSuccessSubject.send(email)
    }
}
