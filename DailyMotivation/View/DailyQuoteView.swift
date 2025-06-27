import SwiftUI

struct DailyQuoteView: View {
    
    @ObservedObject var viewModel: QuoteViewModel
    
    var body: some View {
        VStack {
            if let quote = viewModel.dailyQuote {
                Text("\"\(quote.text)\"")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Text("- \(quote.author)")
                    .font(.headline)
                    .foregroundColor(.secondary)
            } else {
                Text("Fetching your daily quote...")
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    DailyQuoteView(viewModel: QuoteViewModel())
}
