import SwiftUI
import CryptoKit

struct SignInView: View {
    
    @State private var password: String = ""
    @State private var username: String = ""
    
    @State private var message: String = ""
    
    @EnvironmentObject var auth: Authorization
    
    
    var body: some View {
        VStack{
            Text("Sign In")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.pink)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 350.0, height: 210.0)
                    .foregroundColor(Color("Color-1"))
                VStack {
                    TextField("Username", text: $username)
                        .padding()
                    Divider()
                    SecureField("Password", text: $password)
                        .padding()
                    Divider()
                    HStack {
                        Spacer()
                        Button(action: {
                            if username != "" && password != ""
                            {
                                if !auth.signIn(username: username, password: password){
                                    message = "Password is incorrect or user doesn't exist"
                                }
                            }
                            else if username == ""
                            {
                                message = "Username is empty"
                            }
                            else {
                                message = "Password is empty"
                            }
                        }) {
                            Text("Sign In")
                        }
                        .padding()
                        Spacer()
                    }
                    .frame(height: 50.0)
                }
                .frame(width: 320.0)
            }
            Text(message)
                .fontWeight(.black)
                .foregroundColor(Color("AccentColor"))
                .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
            Button("Don't have an account?") {
                auth.changeLoggingValue()
            }
            .frame(height: 50.0)
            Spacer()
        }
    }
}
