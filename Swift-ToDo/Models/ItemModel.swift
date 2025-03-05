//
//  ItemModel.swift
//  Swift-ToDo
//
//  Created by Hassam Shaikh on 05/03/2025.
//

import Foundation

struct ItemModel : Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isComplete: Bool
}
