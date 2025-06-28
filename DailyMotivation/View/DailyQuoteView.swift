import SwiftUI

struct DailyQuoteView: View {
    
    @ObservedObject var viewModel: QuoteViewModel
    
    var body: some View {
        ZStack {
            VStack {
                if let quote = viewModel.dailyQuote {
                    Text("\"\(quote.text)\"")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    Text("- \(quote.author)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                } else {
                    Text("Fetching your daily quote...")
                }
            }
            .padding(.horizontal, 20)
            
            VStack {
                Spacer()
                if let quote = viewModel.dailyQuote {
                    Button(action: {
                        viewModel.toggleFavorite(for: quote)
                    }) {
                        Image(systemName: quote.isFavorite ? "heart.fill" : "heart")
                            .font(.largeTitle)
                            .foregroundColor(.pink)
                    }
                }
            }
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    let previewVM = QuoteViewModel()
    return DailyQuoteView(viewModel: previewVM)
}
