//
//  CustomShape.swift
//  CoreKit
//
//  Created by chenyungui on 2024/10/18.
//

import SwiftUI

public struct CustomShape: Shape {
    
    let path: Path
    let bounds: CGRect
    let fitConfig: FitConfig
    
    /// - Parameters:
    ///   - path: original path
    ///   - bounds: bounds for fitting to render rect
    ///   - fitConfig: fit configuration
    public init(path: Path, bounds: CGRect?, fitConfig: FitConfig) {
        self.path = path
        self.bounds = bounds ?? path.boundingRect
        self.fitConfig = fitConfig
    }
    
    public func path(in rect: CGRect) -> Path {
        let transform = RectFitter.fit(rect: bounds, to: rect, config: fitConfig)
        return path.applying(transform)
    }
}
