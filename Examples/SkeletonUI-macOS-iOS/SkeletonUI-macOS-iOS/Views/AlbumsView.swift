import SwiftUI
import SkeletonUI

struct AlbumsView: View {
    @ObservedObject var albumsViewModel = AlbumsViewModel()
    
    var body: some View {
        NavigationView {
            SkeletonList(with: albumsViewModel.albums, quantity: 6) { loading, album in
                AlbumView(album: album, loading: loading)
            }
            .navigationBarTitle("Top albums")
            .navigationBarItems(trailing: Button(action: {
                self.albumsViewModel.reloadTopAlbums()
            }) {
                Text("Reload")
            })
        }
        .onAppear {
            self.albumsViewModel.fetchTopAlbums()
        }
    }
}

#if DEBUG
struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsView()
    }
}
#endif
