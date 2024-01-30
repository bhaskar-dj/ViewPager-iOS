//
//  ImagePagerView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/15/23.
//

import SwiftUI

struct ImagePagerView: View {
    let viewModel: ImagePagerViewModel
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var scrollToIndex: Int?
    @State var currentItem: Int

    var body: some View {
        HStack {

            if sizeClass == .regular {
                itemListView
            }
            pagerView

            // can use tabView as well for the same results in this POC
//             tabView
//
        }
    }

    @ViewBuilder private var itemListView: some View {
        ScrollViewReader { scrollProxy in
            IndexListView(currentItem: $currentItem)
                .onChange(of: scrollToIndex) { index in
                    withAnimation {
                        scrollProxy.scrollTo(index)
                    }
                }
                .onAppear {
                    scrollToIndex = currentItem
                }
        }
    }

    var tabView: some View {
        TabView(selection: $currentItem) {
            ForEach(viewModel.imageInfos.indices, id: \.self) { index in
                ImageContainerView(viewModel: ImageContainerViewModel(imageInfo: viewModel.imageInfos[index], index: index))
                    .tag(viewModel.imageInfos[index].name)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .edgesIgnoringSafeArea(.bottom)
        .onChange(of: currentItem) { index in
            scrollToIndex = index
        }
    }

    var pagerView: some View {
        ImagePagerViewRepresentable(pages: imageContainerViews, currentPageIndex: $currentItem)
            .onChange(of: currentItem) { index in
                scrollToIndex = index
            }
    }

    var imageContainerViews: [ImageContainerView] {
        var views = [ImageContainerView]()
        for index in viewModel.imageInfos.indices {
            let info = viewModel.imageInfos[index]
            let imgContainerView = ImageContainerView(viewModel: ImageContainerViewModel(imageInfo: info, index: index))
            views.append(imgContainerView)
        }
        return views
    }
}

class ImagePagerViewModel {
    let imageInfos: [ImageInfo]

    init(imageInfos: [ImageInfo]) {
        self.imageInfos = imageInfos
    }
}
