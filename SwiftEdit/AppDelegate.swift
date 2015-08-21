//
//  AppDelegate.swift
//  SwiftEdit
//
//  Created by Scott Horn on 14/06/2014.
//  Copyright (c) 2014 Scott Horn. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow?
    @IBOutlet var scrollView: NSScrollView?
    @IBOutlet var debugScrollView: NSScrollView?
    @IBOutlet var debugTextView: DebugTextView?
    
    var textView: NSTextView { return scrollView!.contentView.documentView as! NSTextView }
    var rulerView: RulerView?
    
    var syntaxHighligher: SwiftSyntaxHighligher?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let textView = self.textView
        textView.textContainerInset = NSMakeSize(0,1)
        textView.font = NSFont.userFixedPitchFontOfSize(NSFont.smallSystemFontSize())
        textView.automaticQuoteSubstitutionEnabled = false

        rulerView = RulerView(scrollView: scrollView, orientation: .VerticalRuler)
        scrollView?.verticalRulerView = rulerView
        scrollView?.hasHorizontalRuler = false
        scrollView?.hasVerticalRuler = true
        scrollView?.rulersVisible = true

        syntaxHighligher = SwiftSyntaxHighligher(textStorage: textView.textStorage!, textView: textView, scrollView: scrollView!)
        
        
        
        
    }
}
