//
//  AppCoordinator.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import Foundation

class AppCoordinator: BaseCoordinator, AppCoordinatorType {
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure(tutorialWasShown: true, isAutorized: true)
    }
    
    override func start(with option: DeepLinkOption?) {
        if let option = option {
            switch option {
            case .home:
                startMainFlow()
            }
        } else {
            switch instructor {
            case .auth: startAuthFlow()
            case .onboarding: startOnboardingFlow()
            case .main: startMainFlow()
            }
        }
    }
}

// MARK: Main Flow
extension AppCoordinator {
    func startMainFlow() {
        let coordinator = container.resolve(MainCoordinatorAssembly.self).build(router: router)
        addChild(coordinator)
        coordinator.start()
        
        self.router.setRootModule(coordinator)
    }
}


// MARK: Game Flow

extension AppCoordinator {
    
    func startGameFlow() {
        let coordinator = container.resolve(GameStartCoordinatorAssembly.self).build()
        addChild(coordinator)
        coordinator.start()
        self.router.present(coordinator)
    }
}


// MARK: Catalog Flow

extension AppCoordinator {
    
    func startCatalogFlow() {
        let coordinator = container.resolve(CatalogCoordinatorAssembly.self).build()
        addChild(coordinator)
        coordinator.start()
        self.router.present(coordinator)
    }
}


// MARK: Rules Flow

extension AppCoordinator {
    
    func startRulesFlow() {
        let coordinator = container.resolve(RulesCoordinatorAssembly.self).build()
        addChild(coordinator)
        coordinator.start()
        self.router.present(coordinator)
    }
}





// MARK: Auth Flow
extension AppCoordinator {
    func startAuthFlow() {
        
    }
}

// MARK: Onboarding Flow
extension AppCoordinator {
    func startOnboardingFlow() {
        
    }
}
