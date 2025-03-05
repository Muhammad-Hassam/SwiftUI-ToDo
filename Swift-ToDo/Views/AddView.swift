//
//  AddView.swift
//  TodoList
//
//  Created by Hassam Shaikh on 04/03/2025.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
//            Text("Hi")
            VStack{
                TextField("Type Something here...", text:$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("TextFieldClr"))
                    .cornerRadius(10)
                    .foregroundColor(Color.black)

                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(16)
        }
        .navigationTitle("Add an Item 🖊️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
