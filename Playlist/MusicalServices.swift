import Foundation

class MusicalServices: NSObject, ObservableObject {
    @Published var services: Array<String> = []
    @Published var AM: String = "Apple Music"
    @Published var VK: String = "VK Music"
    @Published var YM: String = "Yandex Music"
    
    func add(service: String) {
        services.append(service)
    }

    func remove(service: String) {
        if let index = services.firstIndex(of: service) {
            services.remove(at: index)
        }
    }
}
