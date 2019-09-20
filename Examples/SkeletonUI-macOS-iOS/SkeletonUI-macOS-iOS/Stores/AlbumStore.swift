import Combine

protocol AlbumStorable {
    func fetchTopAlbums() -> AnyPublisher<[Album], Never>
}

class AlbumStore: AlbumStorable {
    private let service: AlbumServiceable
    
    init(service: AlbumServiceable) {
        self.service = service
    }
    
    func fetchTopAlbums() -> AnyPublisher<[Album], Never> {
        return service.fetchTopAlbums()
    }
}
