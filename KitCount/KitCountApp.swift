//
//  KitCountApp.swift
//  KitCount
//
//  Created by Marconi Gomes on 02/09/22.
//

import SwiftUI

@main
struct KitCountApp: App {
    var body: some Scene {
        WindowGroup {
            KounterListView()
                .environment(\.managedObjectContext, PersistenceController.shared.persistentContainer.viewContext)
                .onAppear {
                    addMockedKounter()
                }
        }
    }
    
    private func addMockedKounter() {
        let request = Kounter.fetchRequest()
        let context = PersistenceController.shared.persistentContainer.viewContext
        
        do {
            if try context.count(for: request) == 0 {
                try Kounter.generateMocks(in: context)
            }
        } catch {
            print("Error generating Mocked Kounter: \(error)")
        }
    }
}
