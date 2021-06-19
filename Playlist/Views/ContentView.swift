import SwiftUI

struct ContentView: View {
    @EnvironmentObject var services: MusicalServices
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Label("Home", systemImage: "music.note.house")
            }
                .environmentObject(services)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .environmentObject(services)
        }
        
    }
}
