//
//  WelcomeViewModel.swift
//  AhnChiWook_assignment
//
//  Created by 안치욱 on 12/3/25.
//


import Combine

final class WelcomeViewModel {
    
    // MARK: - Input
    struct Input {
        let backButtonTapped: AnyPublisher<Void, Never>
    }
    
    // MARK: - Output
    struct Output {
        let welcomeText: AnyPublisher<String, Never>
        let popEvent: AnyPublisher<Void, Never>
    }
    
    // MARK: - Private subjects
    private let emailSubject: CurrentValueSubject<String, Never>
    private let popEventSubject = PassthroughSubject<Void, Never>()
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(email: String) {
        self.emailSubject = CurrentValueSubject(email)
    }
    
    // MARK: - Transform
    func transform(_ input: Input) -> Output {
        
        input.backButtonTapped
            .sink { [weak self] in
                self?.popEventSubject.send(())
            }
            .store(in: &cancellables)
        
        let welcomeText = emailSubject
            .map { "\($0)님 반가워요!" }
            .eraseToAnyPublisher()
        
        return Output(
            welcomeText: welcomeText,
            popEvent: popEventSubject.eraseToAnyPublisher()
        )
    }
}