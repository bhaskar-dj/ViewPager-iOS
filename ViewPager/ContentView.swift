//
//  ContentView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ListView(viewModel: ListViewModel(imageInfos: SampleImageInfos().infos))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
