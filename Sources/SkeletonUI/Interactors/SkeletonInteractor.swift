import SwiftUI

protocol SkeletonInteractable {
    var loading: Bool { get }
    var shape: ShapeInteractable { get }
    var multiline: MultilineInteractable { get }
    var appearance: AppearanceInteractable { get }
    var animation: AnimationInteractable { get }
}

final class SkeletonInteractor: SkeletonInteractable {
    let loading: Bool
    var shape: ShapeInteractable
    var multiline: MultilineInteractable
    var appearance: AppearanceInteractable
    var animation: AnimationInteractable

    init(loading: Bool, shape: ShapeInteractable = ShapeInteractor(), multiline: MultilineInteractable = MultilineInteractor(), appearance: AppearanceInteractable = AppearanceInteractor(), animation: AnimationInteractable = AnimationInteractor()) {
        self.loading = loading
        self.shape = shape
        self.multiline = multiline
        self.appearance = appearance
        self.animation = animation
    }
}
