//
//  EditTaskView.swift
//  SwiftDataTodoSwiftUI
//
//  Created by Owner on 2023/07/31.
//

import SwiftUI

struct EditTaskView: View {
    
    @Bindable var task: Task
    
    var body: some View {
        TextField("タスクを入力", text: $task.title)
            .padding()
    }
}
