//
//  TaskModel.swift
//  App06-TODO-Firebase
//
//  Created by David Josué Marcial Quero on 07/10/21.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    @Published var categories = [Category]()
    @Published var priorities = [Priority]()
    let db = Firestore.firestore()
    
    init() {
        fetchTasks()
        fetchCategories()
        fetchPriorities()
    }
    
    func fetchTasks() {
        db.collection("Tasks").order(by: "due_date")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                print(documents.count)
                self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                    return try? queryDocumentSnapshot.data(as: Task.self)
                }
            }
    }
    
    func fetchCategories() {
        db.collection("Category").order(by: "category_id")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                print(documents.count)
                self.categories = documents.compactMap { queryDocumentSnapshot -> Category? in
                    return try? queryDocumentSnapshot.data(as: Category.self)
                }
            }
    }
    
    func fetchPriorities() {
        db.collection("Priority").order(by: "priority_id")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching document: \(error!)")
                    return
                }
                print(documents.count)
                self.priorities = documents.compactMap { queryDocumentSnapshot -> Priority? in
                    return try? queryDocumentSnapshot.data(as: Priority.self)
                }
            }
    }
    
    // Función para agregar datos a la base de datos
    func addData(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }
    // Función para actualizar datos en la base de datos
    func updateData(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }
    // Función para borrar datos de la base de datos
    func removeData(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in // (1)
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
}
