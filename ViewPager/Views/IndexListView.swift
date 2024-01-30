//
//  IndexListView.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 1/25/24.
//

import SwiftUI

struct IndexListView: View {
    @Binding var currentItem: Int

    var body: some View {
        List {
            ForEach(0..<10, id: \.self) { index in
                IndexListCell(index: index, currentItem: $currentItem)
                    .id(index)
                    .listRowSeparator(.visible)
                    .frame(height: 80)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        currentItem = index
                    }
            }
        }
        .listStyle(.plain)
        .frame(maxWidth: 200)
    }
}

struct IndexListCell: View {
    var index: Int
    @Binding var currentItem: Int
    var body: some View {
        Text("Item index is \(index)")
            .foregroundStyle(index == currentItem ? Color.blue : Color.black)
    }
}
