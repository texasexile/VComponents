//
//  VChevronButtonFilledModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/23/20.
//

import SwiftUI

// MARK:- V Chevron Button Filled Model
public struct VChevronButtonFilledModel {
    public let layout: Layout
    public let colors: Colors
    let circularButtonModel: VCircularButtonStandardModel
    
    public init(
        layout: Layout = .init(),
        colors: Colors = .init()
    ) {
        self.layout = layout
        self.colors = colors
        
        self.circularButtonModel = .init(
            layout: .init(
                dimension: layout.dimension
            ),
            colors: .init(
                foreground: .init(
                    enabled: colors.foreground.enabled,
                    pressed: colors.foreground.pressed,
                    disabled: colors.foreground.disabled,
                    pressedOpacity: colors.foreground.pressedOpacity,
                    disabledOpacity: colors.foreground.disabledOpacity
                ),
                background: .init(
                    enabled: colors.background.enabled,
                    pressed: colors.background.pressed,
                    disabled: colors.background.disabled
                )
            )
        )
    }
}

// MARK:- Layout
extension VChevronButtonFilledModel {
    public struct Layout {
        public let dimension: CGFloat
        public let iconDimension: CGFloat
        
        public init(
            dimension: CGFloat = 32,
            iconDimension: CGFloat = 20
        ) {
            self.dimension = dimension
            self.iconDimension = iconDimension
        }
    }
}

// MARK:- Colors
extension VChevronButtonFilledModel {
    public struct Colors {
        public let foreground: ForegroundColors
        public let background: BackgroundColors
        
        public init(
            foreground: ForegroundColors = .init(),
            background: BackgroundColors = .init()
        ) {
            self.foreground = foreground
            self.background = background
        }
    }
}

extension VChevronButtonFilledModel {
    public struct ForegroundColors {
        public let enabled: Color
        public let pressed: Color
        public let disabled: Color
        public let pressedOpacity: Double
        public let disabledOpacity: Double
        
        public init(
            enabled: Color = ColorBook.ChevronButton.Icon.enabled,
            pressed: Color = ColorBook.ChevronButton.Icon.pressed,
            disabled: Color = ColorBook.ChevronButton.Icon.disabled,
            pressedOpacity: Double = 1,
            disabledOpacity: Double = 0.5
        ) {
            self.enabled = enabled
            self.pressed = pressed
            self.disabled = disabled
            self.pressedOpacity = pressedOpacity
            self.disabledOpacity = disabledOpacity
        }
    }
    
    public struct BackgroundColors {
        public let enabled: Color
        public let pressed: Color
        public let disabled: Color
        
        public init(
            enabled: Color = ColorBook.ChevronButton.Fill.enabled,
            pressed: Color = ColorBook.ChevronButton.Fill.pressed,
            disabled: Color = ColorBook.ChevronButton.Fill.disabled
        ) {
            self.enabled = enabled
            self.pressed = pressed
            self.disabled = disabled
        }
    }
}