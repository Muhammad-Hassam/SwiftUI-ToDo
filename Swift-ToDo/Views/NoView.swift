//
//  NoView.swift
//  Swift-ToDo
//
//  Created by Hassam Shaikh on 10/03/2025.
//

import SwiftUI

struct NoView: View {
    
    @State var animate:Bool = false
    
    func addAnimation(){
        
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? ")
                Text("Are you a produvtive person? I think you should click the add  button and add a bunch of items to your todo list!")
                    .padding(.bottom,15)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 😃")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color("SecondaryColor") : Color.accentColor)
                            .cornerRadius(10)
                    }
                )
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color("SecondaryColor").opacity(0.7):Color.accentColor.opacity(0.7),
                    radius:animate ? 30 : 10,
                    x:0,
                    y:animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -5 : 0)
            }
            .padding(40)
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)

    }
}

#Preview {
    NavigationView{
        NoView()
    } .navigationTitle("Title")
}
