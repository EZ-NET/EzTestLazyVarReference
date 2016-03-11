//
//  main.swift
//  EzTestLazyVarReference
//
//  Created by Tomohiro Kumagai on 3/11/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Foundation

class Object : ESObject {
    
    override init(identifier: String) {
        
        super.init(identifier: identifier)
    }
    
    lazy var RC1: UInt = {
       
        self.getRC()
    }()
    
    lazy var RC2: UInt = self.getRC()
    
    func getRC() -> UInt {
        
        return referenceCount
    }
}

print("START")

do {

    printTitle("Object の生成確認")

    let object = Object(identifier: "1")
    
    printMarker("参照開始")
    let rc = object.getRC()
    printMarker("参照終了")

    printReferenceCount(rc, comment: "今回の検証では、この参照カウントが基準とみなす")
    printReferenceCountOf(Unmanaged.passUnretained(object), comment: "RC 参照後も同じカウント")
}

do {
    
    printTitle("クロージャー実行式の lazy var 初期化")
    
    let object = Object(identifier: "2")
    
    printMarker("参照開始")
    let rc = object.RC1
    printMarker("参照終了")
    
    printReferenceCount(rc, comment: "クロージャーが包むからか、参照カウントが増加")
    printReferenceCountOf(Unmanaged.passUnretained(object), comment: "RC 参照後はカウントが元に戻る")
}

do {
    
    printTitle("インライン式の lazy var 初期化")
    
    let object = Object(identifier: "3")
    
    printMarker("参照開始")
    let rc = object.RC2
    printMarker("参照終了")
    
    printReferenceCount(rc, comment: "インライン式なら参照カウントは増加しない")
    printReferenceCountOf(Unmanaged.passUnretained(object), comment: "RC 参照後も同じカウント")
}

print("END")
