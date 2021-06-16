import SwiftUI

struct HomeView: View {
    @State private var query: String = ""
    @State private var linkAM: String = ""
    @State private var linkYM: String = ""
    var body: some View {
        VStack {
            Text("Playlist")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.pink)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
        
            ScrollView {
                Text("So you are on PlayList!\nHere you can find your favorite music and share it with you friends.")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .frame(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                
                Image("93025-1")
                    .frame(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text("Now let's find your favourite songs")
                        .font(.headline)
                        .foregroundColor(Color.pink)
                    
                    TextField("Artist_name Song_name", text: $query)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        
                    Button(
                        action : {
                            if query != "" {
                                linkAM = searchAM(name: query)
                                linkYM = searchYM(name: query)
                            }
                            else {
                                linkAM = ""
                            }
                        }
                    ) {
                        Text("                     Search                     ")
                            .foregroundColor(Color("Color"))
                            .fontWeight(.heavy)
                            .padding(8.0)
                            .background(Color.pink)
                            .cornerRadius(50.0)
                    }
                }
                .frame(height: 200.0)
                
                if linkAM != "" && query != ""{
                    HStack {
                        Spacer()
                        Link(destination: URL(string: linkAM)!, label: {
                            Image("Apple Music")
                        })
                        Spacer()
                        Link(destination: URL(string: linkYM)!, label: {
                            Image("Yandex Music")
                        })
                        Spacer()
                    }
                }
                
                
                Image("aaa-1")
                    .frame(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
            }
            .frame(height: 690.0)
            Spacer()
        }
    }
    
    
    func searchAM(name: String) -> String {
        var link: String = ""
        
        let url = URL(string: "https://playlist-ad.herokuapp.com/apple/\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Array<String>
                {
                    link = json[0]
                    semaphore.signal()
                }
            } catch _ as NSError {
                semaphore.signal()
            }
        }
            
        task.resume()
        semaphore.wait()
        
        return link
    }
    func searchYM(name: String) -> String {
        query = name
        var link: String = ""
        
        let url = URL(string: "https://playlist-ad.herokuapp.com/yandex/\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")
        let semaphore = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Array<String>
                {
                    link = json[0]
                    semaphore.signal()
                }
            } catch _ as NSError {
                semaphore.signal()
            }
        }
            
        task.resume()
        semaphore.wait()
        
        return link
    }
}
