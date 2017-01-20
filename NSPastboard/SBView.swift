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

//    override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
//        self.register(forDraggedTypes: [kUTTypeURL as String])
//        // Drawing code here.
//    }
//    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
//        let pasteboard = sender.draggingPasteboard()
//        let filteringOptions = [NSPasteboardURLReadingFileURLsOnlyKey:kUTTypeAudiovisualContent];
//        if pasteboard.canReadObject(forClasses: [NSURL.self], options: filteringOptions) {
//            
//            return NSDragOperation.copy
//        }
//        return NSDragOperation()
//        
//    }
//    override func draggingEnded(_ sender: NSDraggingInfo?) {
//        
//    }
//    override func draggingExited(_ sender: NSDraggingInfo?) {
//        
//    }
//    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
//        Swift.print("kk")
//        return true
//    }
//    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
//        
//        return true
//    }
//    override func concludeDragOperation(_ sender: NSDraggingInfo?) {
//        
//    }
    var filePath: String?
    let expectedExt = ["kext"]  //file extensions allowed for Drag&Drop
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.gray.cgColor
        
        register(forDraggedTypes: [kUTTypeURL as String])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        // Drawing code here.
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if checkExtension(sender) == true {
            self.layer?.backgroundColor = NSColor.blue.cgColor
            return .copy
        } else {
            return NSDragOperation()
        }
    }
    
    fileprivate func checkExtension(_ drag: NSDraggingInfo) -> Bool {
        guard let board = drag.draggingPasteboard().propertyList(forType: "NSFilenamesPboardType") as? NSArray,
            let path = board[0] as? String
            else { return false }
        
        let suffix = URL(fileURLWithPath: path).pathExtension
        for ext in self.expectedExt {
            if ext.lowercased() == suffix {
                return true
            }
        }
        return false
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        self.layer?.backgroundColor = NSColor.gray.cgColor
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo?) {
        self.layer?.backgroundColor = NSColor.gray.cgColor
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let pasteboard = sender.draggingPasteboard().propertyList(forType: "NSFilenamesPboardType") as? NSArray,
            let path = pasteboard[0] as? String
            else { return false }
        
        //GET YOUR FILE PATH !!
        self.filePath = path
        Swift.print("FilePath: \(filePath)")
        
        return true
    }
}
