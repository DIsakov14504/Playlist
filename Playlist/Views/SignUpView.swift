import SwiftUI


struct SignUpView: View {
    
    @EnvironmentObject var auth: Authorization
    
    @State private var password1: String = ""
    @State private var password2: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    
    @State private var message: String = ""
    
    var body: some View {
        VStack{
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.pink)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 350.0, height: 350.0)
                    .foregroundColor(Color("Color-1"))
                VStack {
                    TextField("Email", text: $email)
                        .padding()
                    Divider()
                    TextField("Username", text: $username)
                        .padding()
                    Divider()
                    TextField("Password", text: $password1)
                        .padding()
                    Divider()
                    SecureField("Repeat password", text: $password2)
                        .padding()
                    Divider()
                    HStack {
                        Spacer()
                        Button(action: {
                            if password1 == password2 && email != "" && password2 != ""
                            {
                                if !auth.signUp(email: email, username: username, password: password1) {
                                    message = "User with this username is already exists"
                                }
                            }
                            else if email == ""
                            {
                                message = "Email is empty"
                            }
                            else {
                                message = "Passwords doesn't match"
                                password2 = ""
                            }
                        }) {
                            Text("Sign Up")
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
            Button("Already have an account?") {
                auth.changeLoggingValue()
            }
            .frame(height: 50.0)
            Spacer()
        }
    }
}
