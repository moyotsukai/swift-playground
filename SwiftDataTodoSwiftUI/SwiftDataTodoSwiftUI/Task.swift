//
//  Restaurant.swift
//  SwiftDataTodoSwiftUI
//
//  Created by Owner on 2023/07/31.
//

import Foundation
import SwiftData

@Model
class Task {
    
    var title: String
    var isDone: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
}
