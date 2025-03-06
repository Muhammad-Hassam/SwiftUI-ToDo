//
//  Swift_ToDoApp.swift
//  Swift-ToDo
//
//  Created by Hassam Shaikh on 05/03/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
        }  .environmentObject(listViewModel)
    }
}

