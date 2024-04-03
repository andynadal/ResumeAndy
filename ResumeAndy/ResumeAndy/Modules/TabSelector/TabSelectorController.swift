//
//  TabSelectorController.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 25/03/24.
//

import SwiftUI
import UIKit

final class TabSelectorController: UITabBarController {
    override func viewDidLoad() {
        setupTabs()
        setupStyling()
    }
    
    func setupTabs() {
        let about = UIHostingController(rootView: AboutView())
        about.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB-ABOUT", comment: "Main tab title"),
                                        image: UIImage(systemName: "lightbulb"),
                                        tag: 0)
        
        let homeView = UIHostingController(rootView: ExperienceView())
        homeView.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB-EXPERIENCE", comment: "Main tab title"),
                                           image: UIImage(systemName: "list.bullet.clipboard"),
                                           tag: 0)
        
        let apps = UIHostingController(rootView: AppsView())
        apps.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB-APPS", comment: "Main tab title"),
                                       image: UIImage(systemName: "briefcase"),
                                       tag: 1)
        
        let education = UIHostingController(rootView: EducationView())
        education.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB-EDUCATION", comment: "Main tab title"),
                                            image: UIImage(systemName: "graduationcap"),
                                            tag: 2)
        
        let contact = UIHostingController(rootView: ContactView())
        contact.tabBarItem = UITabBarItem(title: NSLocalizedString("TAB-CONTACT", comment: "Main tab title"),
                                          image: UIImage(systemName: "phone.bubble"),
                                          tag: 2)
        
        setViewControllers([about, homeView, apps, education, contact], animated: true)
        selectedIndex = 1
    }
    
    private func setupStyling() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .systemBackground
    }
}
