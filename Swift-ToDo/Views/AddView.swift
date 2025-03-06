//
//  AddView.swift
//  TodoList
//
//  Created by Hassam Shaikh on 04/03/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    func saveTodo(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate()->Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long! "
            showAlert.toggle()
            return false
        }
        else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    var body: some View {
        ScrollView {
            VStack{
                TextField("Type Something here...", text:$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("TextFieldClr"))
                    .cornerRadius(10)
                    .foregroundColor(Color.black)
                Button(action: {
                    saveTodo()
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
        .alert(isPresented: $showAlert,content: getAlert)
    }
}

#Preview {
    NavigationView {
        AddView()
    }.environmentObject(ListViewModel())
}
