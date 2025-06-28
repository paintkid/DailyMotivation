import Foundation

class QuoteService {
    
    func fetchQuotes() async throws -> [Quote] {
        guard let url = URL(string: "https://zenquotes.io/api/quotes") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
        
        return quotes
    }
}
