import Foundation
import Combine

protocol AlbumServiceable {
    func fetchTopAlbums() -> AnyPublisher<[Album], Never>
}

class AlbumService: AlbumServiceable {
    func fetchTopAlbums() -> AnyPublisher<[Album], Never> {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json") else {
            preconditionFailure()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .map { $0.feed.results }
            .catch({ error in
                Just<[Album]>([])
            })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
