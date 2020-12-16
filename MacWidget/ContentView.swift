//
//  ContentView.swift
//  MacWidget
//
//  Created by Mike Chirico on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MacWidgetDocument
    @State var text:String = "Hello World"
    var body: some View {
        
        VStack{
            Spacer()
            Button(action: {
                
                text = "here 1"
            }) {
                Text("here 1")
                
            }
            Button(action: {
                text = "here 2"
            }) {
                Text("here 2")
            }
            
            Text(text)
                .padding(.all,10)
                .padding([.top,.bottom],10)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(5)
                .shadow(radius: 25)
                .font(Font.custom("Avenir-Black", size: 17))
            Spacer()
        }
        
        
        
        
        
        
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MacWidgetDocument()))
    }
}
