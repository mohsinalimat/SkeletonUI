import Combine

class AlbumsViewModel: ObservableObject {
    @Published var albums = [Album]()
    private let store = AlbumStore(service: AlbumService())
    
    func fetchTopAlbums() {
        albums = [Album]()
        _ = store
            .fetchTopAlbums()
            .sink(receiveValue: { albums in
                self.albums = albums.map { album in
                    album.genres.removeAll { genre -> Bool in
                        return genre.genreId == "34"
                    }
                    return album
                }
            })
    }
    
    func reloadTopAlbums() {
        albums = []
        fetchTopAlbums()
    }
}
