//
//  ViewController.swift
//  TableView
//
//  Created by 吉田敏幸 on 2014/12/14.
//  Copyright (c) 2014年 Toshiyuki Yoshida. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var  tableView : NSTableView!
    
    var songs : [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize Songs
        println("Initialize Songs")
        if self.songs.count == 0 {
            var aSong : Song!
            
            aSong = Song()
            aSong.title="Lovely Rita"
            aSong.duration = 238
            songs.append(aSong)
            
            aSong = Song()
            aSong.title="Good Morning, Good Morning"
            aSong.duration = 212
            songs.append(aSong)
            
            aSong = Song()
            aSong.title="When I'm Sixty Four"
            aSong.duration = 221
            songs.append(aSong)

            
            aSong = Song()
            aSong.title="Midnight Blues"
            aSong.duration = 182
            songs.append(aSong)

            aSong = Song()
            aSong.title="Here Comes the Moon"
            aSong.duration = 187
            songs.append(aSong)

            aSong = Song()
            aSong.title="Golden Sniper"
            aSong.duration = 112
            songs.append(aSong)

            aSong = Song()
            aSong.title="Butler"
            aSong.duration = 92
            songs.append(aSong)

        }
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func numberOfRowsInTableView(aTableView: NSTableView) -> Int
    {
        return songs.count
    }
    
    func tableView(aTableView: NSTableView,
        objectValueForTableColumn aTableColumn: NSTableColumn?,
        row rowIndex: Int) -> AnyObject?
    {
        let titleOfSong = songs[rowIndex].title as NSString
        let durationOfSong = songs[rowIndex].durationString()
        let columnName = aTableColumn?.identifier
        
        if columnName == "Title" {
            return titleOfSong
        }
        else if columnName == "Duration" {
            return durationOfSong
        }
        
        return ""
        
        
    }
    
    func tableViewSelectionDidChange(aNotification: NSNotification)
    {
        let row = tableView.selectedRow
        if row >= 0
        {
            let selected = songs[row].title as String
            NSLog("Selected: \(selected)")
        }
    }

}

