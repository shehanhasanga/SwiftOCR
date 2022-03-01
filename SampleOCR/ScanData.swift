//
//  ScanData.swift
//  SampleOCR
//
//  Created by shehan karunarathna on 2022-02-28.
//

import Foundation
struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
