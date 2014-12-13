//
//  Song.swift
//  TableView
//
//  Created by 吉田敏幸 on 2014/12/14.
//  Copyright (c) 2014年 Toshiyuki Yoshida. All rights reserved.
//

import Foundation

class Song: NSObject {
    var title : String = "A Song"
    var duration : NSTimeInterval = 0.0
   
}

extension Song {
    
    func durationString() -> String {
        return NSString(format:"%i:%02i",Int(self.duration) / 60, Int(self.duration) % 60)
    }
}
