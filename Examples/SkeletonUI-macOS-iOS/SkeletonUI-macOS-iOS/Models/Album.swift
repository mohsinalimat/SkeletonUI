class Album: Decodable, Identifiable {
    let id: String
    let name: String
    var genres: [Genre]
    let releaseDate: String
    let artistName: String
    let artworkUrl100: String
}
