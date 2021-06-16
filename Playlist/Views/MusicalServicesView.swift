import SwiftUI

struct MusicalServicesView: View {
    
    @EnvironmentObject var services: MusicalServices
    
    var body: some View {
        VStack {
            Button(
                action: {
                    if services.services.contains(services.AM){
                        services.remove(service: services.AM)
                    }
                    else{
                        services.add(service: services.AM)
                    }
            },
                label:{
                    HStack{
                        Image(services.AM)
                        VStack {
                            HStack {
                                Text(services.AM)
                                Spacer()
                            }
                            HStack {
                                Text("available for searching songs only")
                                    .font(.caption)
                                    
                                Spacer()
                            }
                        }
                        Spacer()
                        if services.services.contains(services.AM){
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            )
            .foregroundColor(Color("Color"))

            Divider()
            Button(
                action: {
                    if services.services.contains(services.VK){
                        services.remove(service: services.VK)
                    }
                    else{
                        services.add(service: services.VK)
                    }
            },
                label:{
                    HStack{
                        Image(services.VK)
                        Text(services.VK)
                        Spacer()
                        if services.services.contains(services.VK){
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            )
            .foregroundColor(Color("Color"))
            Divider()
            Button(
                action: {
                    if services.services.contains(services.YM){
                        services.remove(service: services.YM)
                    }
                    else{
                        services.add(service: services.YM)
                    }
            },
                label:{
                    HStack{
                        Image(services.YM)
                        Text(services.YM)
                        Spacer()
                        if services.services.contains(services.YM){
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        }
                        else{
                            Image(systemName: "plus.circle")
                        }
                    }
                }
            )
            .foregroundColor(Color("Color"))
            Spacer()
        }
        .padding()
        .navigationTitle("Musical Services")
        .navigationBarTitleDisplayMode(.inline)
    }
}
