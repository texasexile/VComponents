//
//  VSheetModel.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/22/20.
//

import SwiftUI

// MARK:- Type Aliases
public typealias VSheetModelRoundAll = VSheetModel
public typealias VSheetModelRoundTop = VSheetModel
public typealias VSheetModelRoundBottom = VSheetModel

// MARK:- V Sheet Model
public struct VSheetModel {
    public var layout: Layout = .init()
    public var color: Color = ColorBook.layer
    
    public init() {}
}

// MARK:- Layout
extension VSheetModel {
    public struct Layout {
        public var roundedCorners: RoundedCorners = .all
        public var cornerRadius: CGFloat = 15
        
        public var contentPadding: CGFloat = 16
        
        public init() {}
    }
}

extension VSheetModel.Layout {
    public enum RoundedCorners {
        case all
        case top
        case bottom
        case custom(_ corners: UIRectCorner)
        case none
        
        var uiRectCorner: UIRectCorner {
            switch self {
            case .all: return .allCorners
            case .top: return [.topLeft, .topRight]
            case .bottom: return [.bottomLeft, .bottomRight]
            case .custom(let customCorners): return customCorners
            case .none: return []
            }
        }
    }
}