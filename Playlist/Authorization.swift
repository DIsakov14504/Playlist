import Foundation
import CryptoKit

class Authorization: NSObject, ObservableObject {
    
    @Published var asd: String = "ssssss"
    @Published var isLoggedIn: Bool = false
    @Published var isLoggingIn: Bool = false

    func signIn(username: String, password: String) -> Bool {
        if isUserExists(username: username){
            let url = URL(string: "https://playlist-ad.herokuapp.com/check/\(username)")!
            var user_password: String = ""
            let semaphore = DispatchSemaphore(value: 0)
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? Dictionary<String, Any>
                    {
                        user_password = json["password"] as! String
                        semaphore.signal()
                    }
                } catch _ as NSError {
                    semaphore.signal()
                }
            }
                
            task.resume()
            semaphore.wait()
            
            let md = Insecure.MD5.hash(data: password.data(using: .utf8) ?? Data())
            var p = md.map {String(format: "%02hhx", $0)}.joined()
            p = p.replacingOccurrences(of: "0", with: "")
            
            if p == user_password {
                isLoggedIn = true
                return true
            } else {
                return false
            }
        }
        else {
            return false
        }
    }
    
    func signUp(email: String, username: String, password: String) -> Bool {
        if isUserExists(username: username){
            return false
        }
        else {
            let url = URL(string: "https://playlist-ad.herokuapp.com/add/")!
            var request = URLRequest(url: URL(string: "https://playlist-ad.herokuapp.com/add")!)
            
            let md = Insecure.MD5.hash(data: password.data(using: .utf8) ?? Data())
            var user_password = md.map {String(format: "%02hhx", $0)}.joined()
            user_password = user_password.replacingOccurrences(of: "0", with: "")
            
            let parameters = "\(username) \(email) \(user_password)"
            
            let postData = parameters.data(using: .utf8)
            request.httpBody = postData
            request.httpMethod = "POST"
            
            let semaphore = DispatchSemaphore(value: 0)
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let _ = data else {
                    semaphore.signal()
                    return
                  }
                semaphore.signal()
            }
                
            task.resume()
            semaphore.wait()
            
            
            isLoggedIn = true
            return true
        }
    }
    
    private func isUserExists(username: String) -> Bool {
        let url = URL(string: "https://playlist-ad.herokuapp.com/full")!
        var users: Array<String> = []
        let semaphore = DispatchSemaphore (value: 0)
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String]
                {
                    users = jsonArray
                    semaphore.signal()
                }
            } catch _ as NSError {
                semaphore.signal()
            }
        }

        task.resume()
        semaphore.wait()
        
        return users.contains(username)

    }
    
    func changeLoggingValue(){
        isLoggingIn = !isLoggingIn
    }
}
