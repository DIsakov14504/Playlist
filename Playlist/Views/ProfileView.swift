import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var services: MusicalServices
    @State var selection: Int? = nil
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.pink)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
                HStack {
                    Image("Profile Photo")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 80.0, height: 80.0)
                    VStack {
                        Text("Josh")
                            .font(.title)
                            .fontWeight(.light)
                        Text("Swain")
                            .font(.title2)
                            .fontWeight(.ultraLight)
                    }
                    Spacer()
                }
                
                NavigationLink(destination: MusicalServicesView(), tag: 3, selection: $selection) {
                    Button (
                        action: {self.selection = 3},
                        label: {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(Color("Color"))
                                    .frame(width: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                    
                                Text("General")
                                    .foregroundColor(Color("Color"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("Color"))
                            }
                        }
                    )
                }
                Divider()
                NavigationLink(destination: MusicalServicesView(), tag: 3, selection: $selection) {
                    Button (
                        action: {self.selection = 3},
                        label: {
                            HStack {
                                Image(systemName: "music.note")
                                    .foregroundColor(Color("Color"))
                                    .frame(width: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                    
                                Text("Musical Services")
                                    .foregroundColor(Color("Color"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("Color"))
                            }
                        }
                    )
                }
                Divider()
                NavigationLink(destination: MusicalServicesView().environmentObject(services), tag: 3, selection: $selection) {
                    Button (
                        action: {self.selection = 3},
                        label: {
                            HStack {
                                Image(systemName: "pencil.circle")
                                    .foregroundColor(Color("Color"))
                                    .frame(width: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                Text("Appearance")
                                    .foregroundColor(Color("Color"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("Color"))
                            }
                        }
                    )
                }
                Divider()
                NavigationLink(destination: MusicalServicesView(), tag: 3, selection: $selection) {
                    Button (
                        action: {self.selection = 3},
                        label: {
                            HStack {
                                Image(systemName: "hand.raised.fill")
                                    .foregroundColor(Color("Color"))
                                    .frame(width: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                                Text("Privacy")
                                    .foregroundColor(Color("Color"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("Color"))
                            }
                        }
                    )
                }
                Spacer()
            }
            .padding()
            .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-112.0/*@END_MENU_TOKEN@*/)
        }
    }
}
