//
//  ListView.swift
//  TodoList
//
//  Created by Hassam Shaikh on 04/03/2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third"
    ]
    
    var body: some View {
        List {
            ForEach(items, id:\.self){item in
                ListRowView(title: item)
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: Text("Destination"))
        )
        
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}


