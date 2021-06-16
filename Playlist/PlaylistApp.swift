//
//  PlaylistApp.swift
//  Playlist
//
//  Created by D S on 16.06.2021.
//

import SwiftUI

@main
struct PlaylistApp: App {
    @State var auth: Authorization = Authorization()
    @State var services: MusicalServices = MusicalServices()
    let defaults:UserDefaults = UserDefaults.standard
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(auth)
                .environmentObject(services)
        }
    }
}
