//
//  PageViewController.swift
//  AFL3-0706012110031-NuzululSalsabila
//
//  Created by Nuzulul Salsabila on 17/04/23.
//

import SwiftUI
import UIKit

//manages a UIPageViewController and its data source
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    var pages: [Page]
    
    // creates a Coordinator object that manages the UIPageViewController
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //initializes and returns a UIPageViewController object with a scroll and a horizontal navigation orientation
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        //data source of UIPageViewController
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    //sets the first view controller in the controllers array as the currently displayed view controller
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    //providing view controllers to the UIPageViewController object
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        //initialize an array of controllers
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // returns the view controller that should be displayed before the currently displayed view controller
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        //eturns the view controller that should be displayed after the currently displayed view controller
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
    }
}
