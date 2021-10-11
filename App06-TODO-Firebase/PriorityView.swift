//
//  PriorityView.swift
//  App06-TODO-Firebase
//
//  Created by David Josué Marcial Quero on 11/10/21.
//

import SwiftUI

struct PriorityView: View {
    @StateObject var taskModel: TaskModel
    @Binding var task: Task
    
    var body: some View {
        VStack {
            Text(priorityName(task.priority_id))
                .font(.title)
            HStack(spacing: 10) {
                Spacer()
                ForEach(taskModel.priorities) { priority in
                    //Spacer()
                    Image(systemName: priority.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:40, height: 40)
                        .opacity(priority.priority_id == task.priority_id ? 1.0 : 0.2)
                        .onTapGesture {
                            task.priority_id = priority.priority_id
                        }
                }
                Spacer()
            }
        }
    }
    
    func priorityName(_ priority_id: String) -> String {
        if let index = taskModel.priorities.firstIndex(where: {
            $0.priority_id == priority_id
        }) {
            return taskModel.priorities[index].priority
        }
        return ""
    }
}

struct PriorityView_Previews: PreviewProvider {
    @State static var task = Task(task: "Tarea", category_id: "01", priority_id: "01", is_completed: false, date_created: Date(), due_date: Date())
    static var previews: some View {
        PriorityView(taskModel: TaskModel(), task: $task)
    }
}
