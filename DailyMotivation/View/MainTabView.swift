import SwiftUI

struct MainTabView: View {
    
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        TabView {
            DailyQuoteView(viewModel: viewModel)
                .tabItem {
                    Label("Today", systemImage: "sparkles")
                }
            
            FavoritesView(viewModel: viewModel)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
