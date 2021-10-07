//
//  TaskDetailView.swift
//  App06-TODO-Firebase
//
//  Created by David Josué Marcial Quero on 07/10/21.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var taskModel: TaskModel
    var task: Task
    var body: some View {
        VStack {
            Spacer()
            Button() {
                addTask()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
        }
    }
    
    func addTask() {
        let task = Task(task: "Tarea", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date())
        taskModel.addData(task: task)
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), task: Task(task: "Tarea", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date()))
    }
}
