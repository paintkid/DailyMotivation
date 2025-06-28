import SwiftUI

struct FavoritesView: View {

    @ObservedObject var viewModel: QuoteViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.favoriteQuotes.isEmpty {
                Text("You haven't favorited any quotes yet!")
                    .foregroundColor(.secondary)
            } else {
                List(viewModel.favoriteQuotes) { quote in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(quote.text)
                            .font(.headline)
                        Text("- \(quote.author)")
                            .font(.subheadline)
                            .italic()
                    }
                }
                .navigationTitle("Favorites")
            }

        }
    }
}

#Preview {
    let previewViewModel = QuoteViewModel()

    previewViewModel.favoriteQuotes.append(
        Quote(text: "Preview Favorite Quote.", author: "Preview Author", isFavorite: true)
    )
    return FavoritesView(viewModel: previewViewModel)
}
