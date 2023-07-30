//
//  ContentView.swift
//  SwiftDataTodoSwiftUI
//
//  Created by Owner on 2023/07/30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    @Query private var tasks: [Task]
    @State private var showAddTaskView: Bool = false
    @State private var showEditTaskView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(tasks.enumerated()), id: \.offset) { index, task in
                    HStack {
                        Button {
                            task.isDone.toggle()
                        } label: {
                            Image(systemName: task.isDone ? "checkmark" : "square")
                                .frame(width: 24)
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(task.title) {
                            EditTaskView(task: task)
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("タスク")
            .navigationDestination(isPresented: $showAddTaskView) {
                AddTaskView(showAddTaskView: $showAddTaskView)
            }
            .navigationBarItems(
                trailing: Button(action: {
                    showAddTaskView = true
                }) {
                    Text("追加")
                }
            )
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                context.delete(tasks[index])
            }
        }
    }
    
}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Task.self, ModelConfiguration(inMemory: true))
        let sampleTasksk = [
            Task(title: "牛乳を買う"),
            Task(title: "Swiftの勉強をする"),
            Task(title: "積読してる本を読む")
        ]
        for task in sampleTasksk {
            container.mainContext.insert(task)
        }
        
        return container
        
    } catch {
        fatalError("Failed to create container")
    }
}()

#Preview {
    MainActor.assumeIsolated {
        ContentView()
            .modelContainer(previewContainer)
    }
}
