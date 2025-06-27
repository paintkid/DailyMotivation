import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var dailyQuote: Quote?
    @Published var favoriteQuotes: [Quote] = []
    
    private let sampleQuotes: [Quote] = [
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(text: "The journey of a thousand miles begins with a single step.", author: "Lao Tzu"),
        Quote(text: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson"),
        Quote(text: "Act as if what you do makes a difference. It does.", author: "William James"),
        Quote(text: "Success is not final, failure is not fatal: it is the courage to continue that counts.", author: "Winston Churchill")
    ]
    
    init() {
        fetchDailyQuote()
    }
    
    func fetchDailyQuote() {
        self.dailyQuote = sampleQuotes.randomElement()
    }
    
}
