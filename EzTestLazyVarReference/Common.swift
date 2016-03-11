//
//  Common.swift
//  EzTestLazyVarReference
//
//  Created by Tomohiro Kumagai on 3/11/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Foundation

func printTitle(title: String) {
    
    print("")
    print("")
    print("🚩 \(title)")
    print("")
}

func printMarker(comment: String = "") {

    print("💫 \(comment)")
}

func printReferenceCount(count: UInt, comment: String? = nil) {
    
    print("🏁 RC: \(count)", terminator: "")
    
    if let comment = comment {
        
        print("(\(comment))", terminator: "")
    }
    
    print("")
}

func printReferenceCountOf(object: Unmanaged<Object>, comment: String? = nil) {
    
    printReferenceCount(object.takeUnretainedValue().referenceCount, comment: comment)
}

