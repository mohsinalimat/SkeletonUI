//
//  ContentView.swift
//  SkeletonUI-macOS-iOS
//
//  Created by CSolanaM on 17/08/2019.
//  Copyright © 2019 CSolanaM All rights reserved.
//

import SwiftUI
import SkeletonUI

struct ContentView: View {
    @State var items = [ItemRow]()
    
    var body: some View {
        SkeletonList(with: items, quantity: 6) { loading, element in
            HStack {
                Image(uiImage: element?.image)
                    .skeleton(with: loading)
                    .shape(type: .circle)
                    .animation(type: .pulse())
                    .frame(width: 80, height: 80)
                Text(element?.items[0].name)
                    .skeleton(with: loading)
                    .shape(type: .capsule)
                    .appearance(type: .gradient())
                    .multiline(lines: 2, scales: [1: 0.5], spacing: 10)
                    .animation(type: .linear(delay: .zero, autoreverses: true))
                    .frame(width: 120, height: 30)
                Text(element?.items[1].name)
                    .skeleton(with: loading)
                    .shape(type: .capsule)
                    .appearance(type: .gradient())
                    .multiline(lines: 3, scales: [1: 0.5, 2: 0.25], spacing: 10)
                    .animation(type: .linear(range: 0.5...1))
                    .frame(width: 80, height: 50)
                Text(element?.items[2].name)
                    .skeleton(with: loading)
                    .appearance(type: .gradient(.radial, color: Color(hue: .random(in: 0...1), saturation: .random(in: 0...1), brightness: .random(in: 0...1)), background: Color(.systemBackground)))
                    .animation(type: .linear(delay: .zero, autoreverses: true))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                self.items = [ItemRow(id: 0, items: [Item(id: 0, name: "uno\ny medio"), Item(id: 1, name: "uno\ny medio\ny tres cuartos"), Item(id: 2, name: "uno")], image: UIImage(systemName: "clock")!), ItemRow(id: 1, items: [Item(id: 0, name: "dos\ny medio"), Item(id: 1, name: "dos\ny medio\ny tres cuartos"), Item(id: 2, name: "dos")], image: UIImage(systemName: "clock")!), ItemRow(id: 2, items: [Item(id: 2, name: "tres\ny medio"), Item(id: 1, name: "tres\ny medio\ny tres cuartos"), Item(id: 2, name: "tres")], image: UIImage(systemName: "clock")!)]
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
