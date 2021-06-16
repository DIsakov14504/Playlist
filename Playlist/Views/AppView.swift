import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var auth: Authorization
    @EnvironmentObject var services: MusicalServices
    
    var body: some View {
        if (auth.isLoggedIn == true){
            ContentView()
                .environmentObject(services)
        }
        else {
            if (auth.isLoggingIn == false){
                SignUpView()
                    .environmentObject(auth)
            }
            else {
                SignInView()
            }
        }
    }
}
