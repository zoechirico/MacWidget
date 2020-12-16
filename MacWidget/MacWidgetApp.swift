//
//  MacWidgetApp.swift
//  MacWidget
//
//  Created by Mike Chirico on 12/16/20.
//

import SwiftUI

@main
struct MacWidgetApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MacWidgetDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
