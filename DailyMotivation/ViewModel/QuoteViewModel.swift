import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    
    @Published var dailyQuote: Quote?
    @Published var favoriteQuotes: [Quote] = []
    @Published var errorMessage: String?
    
    private var allQuotes: [Quote] = []
    private let quoteService = QuoteService()
    
    private let favoritesKey = "quote_favorites"
    
    init() {
        Task {
            await fetchAllQuotes()
            
            if !allQuotes.isEmpty {
                loadFavorites()
                fetchDailyQuote()
            }
        }
    }
    
    func fetchDailyQuote() {
        dailyQuote = allQuotes.randomElement()
    }

    func fetchAllQuotes() async {
        errorMessage = nil
        
        do {
            allQuotes = try await quoteService.fetchQuotes()
            print("Successfully fetched \(allQuotes.count) quotes.")
        } catch {
            errorMessage = "Failed to fetch quotes. Please check your connection and try again."
            print("Error fetching quotes: \(error)")
        }
    }
    
    func toggleFavorite(for quote: Quote) {
        guard let index = allQuotes.firstIndex(where: {
            $0.id == quote.id
        }) else {
            return
        }
        
        allQuotes[index].isFavorite.toggle()
        
        if self.dailyQuote?.id == quote.id {
            self.dailyQuote?.isFavorite = allQuotes[index].isFavorite
        }
        
        updateFavoritesList()
        saveFavorites()
    }
    
    private func updateFavoritesList() {
        favoriteQuotes = allQuotes.filter { $0.isFavorite }
    }
    
    private func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(favoriteQuotes)
            UserDefaults.standard.set(data, forKey: favoritesKey)
            print("Favorites saved successfully.")
        } catch {
            print("Failed to save favorites: \(error)")
        }
    }
    
    private func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else { return }
        
        do {
            let savedFavorites = try JSONDecoder().decode([Quote].self, from: data)
            print("Favorites loaded successfully.")
            
            for savedQuote in savedFavorites {
                if let index = allQuotes.firstIndex(where: { $0.text == savedQuote.text }) {
                    allQuotes[index].isFavorite = true
                }
            }

            updateFavoritesList()
            
        } catch {
            print("Failed to load favorites: \(error)")
        }
    }
}
