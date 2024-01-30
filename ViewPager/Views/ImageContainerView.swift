//
//  ImageContainerView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/15/23.
//

import SwiftUI

struct ImageContainerView: View {
    let viewModel: ImageContainerViewModel
    let staticText = """
"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
"""

    var body: some View {
        stack
    }

    @ViewBuilder var stack: some View {
        ScrollView {
            VStack {
                Text(viewModel.imageInfo.name)
                    .font(.largeTitle)
                Text(staticText)
                    .font(.subheadline)
                Text(staticText)
                    .font(.subheadline)
                Text(staticText)
                    .font(.subheadline)
                Text(staticText)
                    .font(.subheadline)
                Text(staticText)
                    .font(.subheadline)
                AsyncImage(url: viewModel.imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ImageContainerViewModel {
    let imageInfo: ImageInfo
    let index: Int
    var imageUrl: URL? {
        URL(string: imageInfo.url)
    }
}
