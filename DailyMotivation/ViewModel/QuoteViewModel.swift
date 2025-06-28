import Foundation

@MainActor
class QuoteViewModel: ObservableObject {
    
    @Published var dailyQuote: Quote?
    @Published var favoriteQuotes: [Quote] = []
    @Published var errorMessage: String?
    
    private var allQuotes: [Quote] = []
    private let quoteService = QuoteService()
    
    init() {
        Task {
            await fetchAllQuotes()
            if allQuotes.isEmpty == false {
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
}
