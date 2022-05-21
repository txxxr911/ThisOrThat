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
        container.apply(SetInfoAssembly.self)
        
        // Setup Services
        container.apply(AppConfigServiceAssembly.self)
        container.apply(EnvironmentServiceAssembly.self)
        container.apply(PlayerDataServiceAssembly.self)
        container.apply(QuestionDataServiceAssembly.self)
        container.apply(SetDataServiceAssembly.self)
        container.apply(PurchaseServiceAssembly.self)
        return container
    }()
    
    override var services: [AppDelegateService] {
        return [
            ApplicationService(container: container, window: window)
        ]
    }
    
    
    func applyAppearance() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        UIViewController.swizzle()
        
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

private let swizzling: (UIViewController.Type, Selector, Selector) -> Void = { forClass, originalSelector, swizzledSelector in
    if let originalMethod = class_getInstanceMethod(forClass, originalSelector), let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) {
        let didAddMethod = class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        if didAddMethod {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
extension UIViewController {
    static func swizzle() {
        let originalSelector1 = #selector(viewDidLoad)
        let swizzledSelector1 = #selector(swizzled_viewDidLoad)
        swizzling(UIViewController.self, originalSelector1, swizzledSelector1)
    }
    
    @objc open func swizzled_viewDidLoad() {
        if let _ = navigationController {
            if #available(iOS 14.0, *) {
                navigationItem.backButtonDisplayMode = .minimal
            } else {
                // Fallback on earlier versions
                navigationItem.backButtonTitle = ""
            }
        }
        swizzled_viewDidLoad()
    }
    
    
}

