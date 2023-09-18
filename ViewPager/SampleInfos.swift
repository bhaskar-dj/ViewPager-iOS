//
//  SampleInfos.swift
//  ViewPager
//
//  Created by Bhaskar Ghosh on 8/17/23.
//

import Foundation

struct ImageInfo: Identifiable, Hashable {
    let url: String
    let name: String
    let id = UUID().uuidString
}

struct SampleImageInfos {
    var infos: [ImageInfo]

    init() {
        let imgInfo1 = ImageInfo(url: "https://images.wsj.net/im-812767/?width=2000&size=1.5",
                                 name: "imageInfo1")
        let imgInfo2 = ImageInfo(url: "https://images.wsj.net/im-816855?size=1.707",
                                   name: "imageInfo2")
        let imgInfo3 = ImageInfo(url: "https://images.wsj.net/im-815852?size=1.673",
                                 name: "imageInfo3")
        let imgInfo4 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo4")
        self.infos = [imgInfo1, imgInfo2, imgInfo3, imgInfo4]
    }
}
