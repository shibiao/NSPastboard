//
//  SBView.swift
//  NSPastboard
//
//  Created by sycf_ios on 2017/1/19.
//  Copyright © 2017年 sycf_ios. All rights reserved.
//

import Cocoa
import AVFoundation
class SBView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.register(forDraggedTypes: [kUTTypeURL as String])
        // Drawing code here.
    }
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        let pasteboard = sender.draggingPasteboard()
        let filteringOptions = [NSPasteboardURLReadingFileURLsOnlyKey:kUTTypeAudiovisualContent];
        if pasteboard.canReadObject(forClasses: [NSURL.self], options: filteringOptions) {
            
            return NSDragOperation.copy
        }
        return NSDragOperation()
        
    }
    override func draggingEnded(_ sender: NSDraggingInfo?) {
        
    }
    override func draggingExited(_ sender: NSDraggingInfo?) {
        
    }
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        Swift.print("kk")
        return true
    }
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        
        return true
    }
    override func concludeDragOperation(_ sender: NSDraggingInfo?) {
        
    }
}
