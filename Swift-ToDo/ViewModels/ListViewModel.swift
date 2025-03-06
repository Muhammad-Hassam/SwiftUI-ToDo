//
//  ListViewModel.swift
//  Swift-ToDo
//
//  Created by Hassam Shaikh on 05/03/2025.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems() {
        let newItem = [ItemModel(title: "This is the first title", isComplete: true),
                       ItemModel(title: "This is the second title", isComplete: false),
                       ItemModel(title: "This is the third title", isComplete: true)]
        items.append(contentsOf: newItem)
    }
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from:IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let newItem = ItemModel(title: title, isComplete: false)
        items.append(newItem)
    }
    
    func updateItem(item:ItemModel) {
//        if let index = items.firstIndex{ (existingItem) -> Bool in
//            return existingItem.id == item.id
//            
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
}

