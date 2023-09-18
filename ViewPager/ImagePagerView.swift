//
//  ImagePagerView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/15/23.
//

import SwiftUI

struct ImagePagerView: View {
    let viewModel: ImagePagerViewModel
    @Binding var tabItem: Int {
        willSet {
            if newValue > tabItem {
                direction = .forward
            } else {
                direction = .reverse
            }
        }
    }

    @State var direction: UIPageViewController.NavigationDirection = .forward

    var body: some View {
        // tabView
        pagerViewRepresentable
    }

    @ViewBuilder var tabView: some View {
        TabView(selection: $tabItem) {
            ForEach(viewModel.imageInfos.indices, id: \.self) { index in
                ImageContainerView(viewModel: ImageContainerViewModel(imageInfo: viewModel.imageInfos[index], index: index))
                    .tag(viewModel.imageInfos[index].name)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .edgesIgnoringSafeArea(.bottom)
    }

    var pagerViewRepresentable: ImagePagerViewRepresentable {
        let pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal)
        pageViewController.dataSource = viewModel
        pageViewController.delegate = viewModel

        // create child view controllers for the page VC
        var viewControllers = [UIViewController]()
        for index in viewModel.imageInfos.indices {
            let info = viewModel.imageInfos[index]
            let imgContainerView = ImageContainerView(viewModel: ImageContainerViewModel(imageInfo: info, index: index))
            let hostingController = UIHostingController(rootView: imgContainerView)
            viewControllers.append(hostingController)
        }

        viewModel.childViewControllers = viewControllers

        if tabItem >= 0 && tabItem < viewControllers.count {
            pageViewController.setViewControllers([viewControllers[tabItem]],
                                                  direction: direction,
                                                  animated: true)
        } else if let firstVC = viewControllers.first {
            pageViewController.setViewControllers([firstVC],
                                                  direction: .forward,
                                                  animated: true)
        }

        return ImagePagerViewRepresentable(pageViewController: pageViewController)
    }
}

class ImagePagerViewModel: NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    let imageInfos: [ImageInfo]
    let appState: ViewPagerAppState
    var childViewControllers: [UIViewController]?

    init(imageInfos: [ImageInfo], appState: ViewPagerAppState) {
        self.imageInfos = imageInfos
        self.appState = appState
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = childViewControllers,
              let currentIndex = viewControllers.firstIndex(of: viewController),
              currentIndex > 0 else { return nil }

        return viewControllers[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = childViewControllers,
              let currentIndex = viewControllers.firstIndex(of: viewController),
              currentIndex < viewControllers.count - 1 else { return nil }

        return viewControllers[currentIndex + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstVC = pageViewController.viewControllers?.first {
            let index = childViewControllers?.firstIndex(of: firstVC) ?? 0
            appState.currentTabIndex = index
        }
    }
}
