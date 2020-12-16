//
//  ContentView.swift
//  MacWidget
//
//  Created by Mike Chirico on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MacWidgetDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MacWidgetDocument()))
    }
}
