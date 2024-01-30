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
        let imgInfo5 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo5")
        let imgInfo6 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo6")
        let imgInfo7 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo7")
        let imgInfo8 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo8")
        let imgInfo9 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo9")
        let imgInfo10 = ImageInfo(url: "https://images.wsj.net/im-833629/?width=2000&size=1.9493177387914",
                                 name: "imageInfo10")

        // assign all the imgInfo objects to self.infos
        self.infos = [imgInfo1, imgInfo2, imgInfo3, imgInfo4, imgInfo5, imgInfo6, imgInfo7, imgInfo8, imgInfo9, imgInfo10]
    }
}

