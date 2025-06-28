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
            
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    let previewVM = QuoteViewModel()
    return DailyQuoteView(viewModel: previewVM)
}
