//
//  ViewController.swift
//  NSPastboard
//
//  Created by sycf_ios on 2017/1/19.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewDidAppear() {
//        let openPanel = NSOpenPanel(contentRect: NSMakeRect(0, 0, 300, 300), styleMask: .closable, backing: .buffered, defer: true)
//        openPanel.allowsMultipleSelection = false
//        openPanel.canChooseFiles = true
//        openPanel.canChooseDirectories = true
//        openPanel.canCreateDirectories = true
//        openPanel.directoryURL = NSURL .fileURL(withPath: "/Users/sycf_ios_13579/Downloads/VLCKit")
//        self.view.window?.addChildWindow(openPanel, ordered: .)
        let fileURL = NSURL.fileURL(withPath: "/Users/sycf_ios_13579/Downloads/VLCKit")
//        let folderURL = fileURL.deletingLastPathComponent()
        NSWorkspace.shared().open(fileURL)
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

