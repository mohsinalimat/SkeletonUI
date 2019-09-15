import SwiftUI
import SkeletonUI

struct AlbumView: View {
    @ObservedObject var imageViewModel: ImageViewModel
    let album: Album?
    let loading: Bool

    init(album: Album?, loading: Bool) {
        self.album = album
        self.loading = loading
        self.imageViewModel = ImageViewModel(album?.artworkUrl100)
    }

    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: imageViewModel.data))
                .resizable()
                .skeleton(with: loading)
                .shape(type: .circle)
                .appearance(type: .gradient())
                .animation(type: .linear())
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text(album?.artistName)
                .skeleton(with: loading)
                .shape(type: .capsule)
                .appearance(type: .gradient())
                .animation(type: .linear())
        }
    }
}

#if DEBUG
struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(album: nil, loading: false)
    }
}
#endif
