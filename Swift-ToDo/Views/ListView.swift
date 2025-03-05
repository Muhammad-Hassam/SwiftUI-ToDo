//
//  ListView.swift
//  TodoList
//
//  Created by Hassam Shaikh on 04/03/2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title", isComplete: true),
        ItemModel(title: "This is the second title", isComplete: false),
        ItemModel(title: "This is the third title", isComplete: true),
    ]
    
    var body: some View {
        List {
            ForEach(items){item in
                ListRowView(item: item)
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


