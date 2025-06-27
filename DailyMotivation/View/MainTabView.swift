import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DailyQuoteView()
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
