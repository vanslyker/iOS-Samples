//
//  SampleData.h
//  CollectionView101
//
//  Copyright © 2016 GrapeCity. All rights reserved.
//
import Foundation
class SampleData: NSObject {
    var title: String = ""
    var subtitle: String = ""
    var thumbnail: String = ""
    var link: String = ""
    var channelTitle: String = ""

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
        
        super.init()

    }
}