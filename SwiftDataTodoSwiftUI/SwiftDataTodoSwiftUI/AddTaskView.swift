//
//  AddTaskView.swift
//  SwiftDataTodoSwiftUI
//
//  Created by Owner on 2023/07/31.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.modelContext) private var context
    @State var task = Task(title: "")
    @Binding var showAddTaskView: Bool
    
    var body: some View {
        TextField("タスクを入力", text: $task.title)
            .padding()
            .navigationBarItems(
                leading: Button(action: {
                    context.insert(task)
                    showAddTaskView = false
                }) {
                    Text("保存")
                }
            )
    }
}

