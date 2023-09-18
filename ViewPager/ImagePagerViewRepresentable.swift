//
//  ImagePagerViewRepresentable.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 9/18/23.
//

import Foundation
import SwiftUI

struct ImagePagerViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIPageViewController
    let pageViewController: UIPageViewController

    func makeUIViewController(context: Context) -> UIPageViewController {
        pageViewController
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {}
}
