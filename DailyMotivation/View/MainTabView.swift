import SwiftUI

struct MainTabView: View {
    
    @StateObject private var viewModel = QuoteViewModel()
    
    var body: some View {
        TabView {
            DailyQuoteView(viewModel: viewModel)
                .tabItem {
                    Label("Today", systemImage: "sparkles")
                }
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
    }
}

#Preview {
    MainTabView()
}
