//
//  Utilities.swift
//  LunaShop
//
//  Created by Ximena Rotceh Mendoza Gamino on 06/04/25.
//

import Foundation
import SwiftUICore
import UIKit
import Shimmer

public struct Constants {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height



  
}
extension Color {
    static let lunaPinkColor = Color("lunaPink")
}

struct URLConstants {
    static let urlProductFinder = "https://api.mercadolibre.com/products/search?"
    static let urlDetailProduct =  "https://api.mercadolibre.com/products/"
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct shimmerViewModifier: ViewModifier {
    let isLoading: Bool
    func body(content: Content) -> some View {
        content
            .redacted(
                reason: isLoading ? .placeholder : []
            )
            .shimmering(
                active: isLoading,
                bandSize: 2
               )
    }
}
extension View {
    func elementWithShimmer(isLoading: Bool) -> some View
    {
        self.modifier(shimmerViewModifier(isLoading: isLoading))
    }
}
extension Notification.Name {
    static let didPopToRoot = Notification.Name("didPopToRoot")
}

