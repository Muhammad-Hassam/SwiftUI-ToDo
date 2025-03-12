//
//  ListView.swift
//  TodoList
//
//  Created by Hassam Shaikh on 04/03/2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty{
                NoView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else{
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform:listViewModel.moveItem)
                }
                .listStyle(.grouped)
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .environmentObject(ListViewModel())
}


