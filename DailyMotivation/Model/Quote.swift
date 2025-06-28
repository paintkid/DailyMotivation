import Foundation

struct Quote: Identifiable, Codable {
    let id = UUID()
    let text: String
    let author: String
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case text = "q"
        case author = "a"
    }
}
