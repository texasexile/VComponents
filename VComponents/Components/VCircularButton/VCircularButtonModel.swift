//
//  VCircularButtonModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI

// MARK:- V Circular Button Model
public struct VCircularButtonModel {
    public let layout: Layout
    public let colors: Colors
    public let fonts: Fonts
    
    public init(
        layout: Layout = .init(),
        colors: Colors = .init(),
        fonts: Fonts = .init()
    ) {
        self.layout = layout
        self.colors = colors
        self.fonts = fonts
    }
}

// MARK:- Layout
extension VCircularButtonModel {
    public struct Layout {
        public let dimension: CGFloat
        
        public init(
            dimension: CGFloat = 44
        ) {
            self.dimension = dimension
        }
    }
}

// MARK:- Colors
extension VCircularButtonModel {
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

extension VCircularButtonModel {
    public struct ForegroundColors {
        public let enabled: Color
        public let pressed: Color
        public let disabled: Color
        public let pressedOpacity: Double
        
        public init(
            enabled: Color = ColorBook.CircularButton.Text.enabled,
            pressed: Color = ColorBook.CircularButton.Text.pressed,
            disabled: Color = ColorBook.CircularButton.Text.disabled,
            pressedOpacity: Double = 0.5
        ) {
            self.enabled = enabled
            self.pressed = pressed
            self.disabled = disabled
            self.pressedOpacity = pressedOpacity
        }
    }
    
    public struct BackgroundColors {
        public let enabled: Color
        public let pressed: Color
        public let disabled: Color
        
        public init(
            enabled: Color = ColorBook.CircularButton.Fill.enabled,
            pressed: Color = ColorBook.CircularButton.Fill.pressed,
            disabled: Color = ColorBook.CircularButton.Fill.disabled
        ) {
            self.enabled = enabled
            self.pressed = pressed
            self.disabled = disabled
        }
    }
}

// MARK:- Fonts
extension VCircularButtonModel {
    public struct Fonts {
        public let title: Font
        
        public init(
            title: Font = FontBook.buttonSmall
        ) {
            self.title = title
        }
    }
}

// MARK:- Mapping
extension VCircularButtonModel.Colors {
    func foregroundColor(state: VCircularButtonInternalState) -> Color {
        switch state {
        case .enabled: return foreground.enabled
        case .pressed: return foreground.pressed
        case .disabled: return foreground.disabled
        }
    }

    func backgroundColor(state: VCircularButtonInternalState) -> Color {
        switch state {
        case .enabled: return background.enabled
        case .pressed: return background.pressed
        case .disabled: return background.disabled
        }
    }
    
    func foregroundOpacity(state: VCircularButtonInternalState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return foreground.pressedOpacity
        case .disabled: return 1
        }
    }
}