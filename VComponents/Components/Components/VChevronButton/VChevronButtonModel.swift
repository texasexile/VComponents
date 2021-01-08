//
//  VChevronButtonModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/23/20.
//

import SwiftUI

// MARK:- V Chevron Button Model
public struct VChevronButtonModel {
    public var layout: Layout = .init()
    public var colors: Colors = .init()
    var font: Font { .system(size: layout.iconDimension, weight: .semibold, design: .default) }
    
    public init() {}
}

// MARK:- Layout
extension VChevronButtonModel {
    public struct Layout {
        public var dimension: CGFloat = 32
        
        public var iconDimension: CGFloat = 14
        
        public var hitBoxSpacingX: CGFloat = 0
        public var hitBoxSpacingY: CGFloat = 0
        
        public init() {}
    }
}

// MARK:- Colors
extension VChevronButtonModel {
    public struct Colors {
        public var foreground: StateAndOpacityColors = .init(
            enabled: ColorBook.primary,
            pressed: ColorBook.primary,
            disabled: ColorBook.primary,
            pressedOpacity: 0.5,
            disabledOpacity: 0.5
        )
        
        public var background: StateColors = .init(
            enabled: .init(componentAsset: "ChevronButton.Background.enabled"),
            pressed: .init(componentAsset: "ChevronButton.Background.pressed"),
            disabled: .init(componentAsset: "ChevronButton.Background.disabled")
        )
        
        public init() {}
    }
}

extension VChevronButtonModel.Colors {
    public typealias StateColors = VSecondaryButtonModel.Colors.StateColors
    
    public struct StateAndOpacityColors {
        public var enabled: Color
        public var pressed: Color
        public var disabled: Color
        public var pressedOpacity: Double
        public var disabledOpacity: Double
    }
}

// MARK:- Mapping
extension VChevronButtonModel.Colors {
    func foregroundColor(state: VChevronButtonInternalState) -> Color {
        color(for: state, from: foreground)
    }
    
    func foregroundOpacity(state: VChevronButtonInternalState) -> Double {
        switch state {
        case .enabled: return 1
        case .pressed: return foreground.pressedOpacity
        case .disabled: return foreground.disabledOpacity
        }
    }
    
    func backgroundColor(state: VChevronButtonInternalState) -> Color {
        color(for: state, from: background)
    }
    
    private func color(for state: VChevronButtonInternalState, from colorSet: StateColors) -> Color {
        switch state {
        case .enabled: return colorSet.enabled
        case .pressed: return colorSet.pressed
        case .disabled: return colorSet.disabled
        }
    }

    private func color(for state: VChevronButtonInternalState, from colorSet: StateAndOpacityColors) -> Color {
        switch state {
        case .enabled: return colorSet.enabled
        case .pressed: return colorSet.pressed
        case .disabled: return colorSet.disabled
        }
    }
}