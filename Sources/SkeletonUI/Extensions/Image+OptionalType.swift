import SwiftUI

public extension Image {
    init(uiImage: UIImage?) {
        if let uiImage = uiImage {
            self.init(uiImage: uiImage)
        } else {
            self.init(uiImage: UIImage())
        }
    }

    init(_ name: String?, bundle: Bundle? = nil) {
        if let name = name {
            self.init(name, bundle: bundle)
        } else {
            self.init(String(), bundle: bundle)
        }
    }

    init(_ name: String?, bundle: Bundle? = nil, label: Text) {
        if let name = name {
            self.init(name, bundle: bundle, label: label)
        } else {
            self.init(String(), bundle: bundle, label: label)
        }
    }

    init(decorative name: String?, bundle: Bundle? = nil) {
        if let name = name {
            self.init(decorative: name, bundle: bundle)
        } else {
            self.init(decorative: String(), bundle: bundle)
        }
    }

    init(systemName: String?) {
        if let systemName = systemName {
            self.init(systemName: systemName)
        } else {
            self.init(systemName: String())
        }
    }

    init(_ cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up, label: Text) {
        if let cgImage = cgImage {
            self.init(cgImage, scale: scale, orientation: orientation, label: label)
        } else if let image = UIImage().cgImage {
            self.init(image, scale: scale, orientation: orientation, label: label)
        } else {
            self.init(String())
        }
    }

    init(decorative cgImage: CGImage?, scale: CGFloat, orientation: Image.Orientation = .up) {
        if let cgImage = cgImage {
            self.init(decorative: cgImage, scale: scale, orientation: orientation)
        } else if let image = UIImage().cgImage {
            self.init(decorative: image, scale: scale, orientation: orientation)
        } else {
            self.init(String())
        }
    }
}
