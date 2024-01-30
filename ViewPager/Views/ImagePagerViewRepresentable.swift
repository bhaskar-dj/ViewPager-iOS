//
//  ImagePagerViewRepresentable.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 9/18/23.
//

import Foundation
import SwiftUI

struct ImagePagerViewRepresentable<Page: View>: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    var pages: [Page]
    @Binding var currentPageIndex: Int

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPageIndex]],
            direction: .forward,
            animated: true,
            completion: nil
        )

        return pageViewController
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        if currentPageIndex == context.coordinator.previousPageIndex { return }
        var direction: UIPageViewController.NavigationDirection = .forward
        if currentPageIndex < context.coordinator.previousPageIndex {
            direction = .reverse
        }
        context.coordinator.previousPageIndex = currentPageIndex
        uiViewController.setViewControllers(
            [context.coordinator.controllers[currentPageIndex]],
            direction: direction,
            animated: true,
            completion: nil
        )
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, previousIndex: currentPageIndex)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController),
                  parent.currentPageIndex > 0 else { return nil }
            return index == 0 ? controllers.last : controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController),
                  parent.currentPageIndex < controllers.count - 1 else { return nil }
            return index == controllers.count - 1 ? controllers.first : controllers[index + 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPageIndex = index
            }
        }


        var parent: ImagePagerViewRepresentable
        var controllers = [UIViewController]()
        var previousPageIndex: Int
        var direction: UIPageViewController.NavigationDirection = .forward

        init(_ parent: ImagePagerViewRepresentable, previousIndex: Int) {
            self.parent = parent
            self.previousPageIndex = previousIndex
            self.controllers = parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
    }
}
