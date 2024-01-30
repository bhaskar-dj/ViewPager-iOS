//
//  ListView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/17/23.
//

import SwiftUI

struct ListView: View {
    let viewModel: ListViewModel
    var body: some View {
        NavigationView {
            List(viewModel.imageInfos.indices, id: \.self) { index in
                NavigationLink(destination: destinationView(index)) {
                    Text(viewModel.imageInfos[index].name)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    @ViewBuilder func destinationView(_ index: Int) -> some View {
        ImagePagerView(
            viewModel: ImagePagerViewModel(
                imageInfos: viewModel.imageInfos
            ),
            currentItem: index
        )
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ListViewModel {
    let imageInfos: [ImageInfo]
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel(imageInfos: SampleImageInfos().infos))
    }
}
