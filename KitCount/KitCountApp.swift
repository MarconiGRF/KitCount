//
//  KitCountApp.swift
//  KitCount
//
//  Created by Marconi Gomes on 02/09/22.
//

import SwiftUI

@main
struct KitCountApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
