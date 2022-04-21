//
//  AppDelegate.swift
//  ThisOrThat
//
//  Created by Victor on 16.04.2022
//  
//

import UIKit

@UIApplicationMain
class AppDelegate: AppDelegateManager {
    var window: UIWindow?
    
    lazy var container: DependencyContainer = {
        let factory = AssemblyFactory()
        let container = DependencyContainer(assemblyFactory: factory)
        setupFonts()
        // Setup Coordinators
        container.apply(AppCoordinatorAssembly.self)
        container.apply(MainCoordinatorAssembly.self)
        container.apply(StartGameAssembly.self)
        container.apply(CatalogAssembly.self)
        container.apply(RulesAssembly.self)
        
        // Setup Modules
        container.apply(MainAssembly.self)
        container.apply(StartGameAssembly.self)
        container.apply(CatalogAssembly.self)
        container.apply(RulesAssembly.self)
        container.apply(GameProcessAssembly.self)
        container.apply(ResultsAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        container.apply(StorageServiceAssembly.self)
        
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
    
    
    func setupFonts() {
            let fontsOtf = Bundle.main.urls(forResourcesWithExtension: "otf", subdirectory: nil)
            let fontsTtf = Bundle.main.urls(forResourcesWithExtension: "ttf", subdirectory: nil)
            
            let fonts = [fontsTtf, fontsOtf].compactMap {$0}.flatMap {$0}
            fonts.forEach({ url in
                CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
            })
        }
}

