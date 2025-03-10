//
//  ItemModel.swift
//  Swift-ToDo
//
//  Created by Hassam Shaikh on 05/03/2025.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id:String = UUID().uuidString, title:String, isComplete:Bool){
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplete: !isComplete)
    }
}
