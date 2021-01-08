//
//  VSquareButton.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI

// MARK:- V Square Button
public struct VSquareButton<Content>: View where Content: View {
    // MARK: Properties
    private let model: VSquareButtonModel
    
    private let state: VSquareButtonState
    @State private var isPressed: Bool = false
    private var internalState: VSquareButtonInternalState { .init(state: state, isPressed: isPressed) }
    
    private let action: () -> Void
    
    private let content: () -> Content

    // MARK: Initializers
    public init(
        model: VSquareButtonModel = .init(),
        state: VSquareButtonState = .enabled,
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.model = model
        self.state = state
        self.action = action
        self.content = content
    }

    public init<S>(
        model: VSquareButtonModel = .init(),
        state: VSquareButtonState = .enabled,
        action: @escaping () -> Void,
        title: S
    )
        where
            Content == VGenericTitleContentView<S>,
            S: StringProtocol
    {
        self.init(
            model: model,
            state: state,
            action: action,
            content: {
                VGenericTitleContentView(
                    title: title,
                    color: model.colors.textColor(state: .init(state: state, isPressed: false)),
                    font: model.font
                )
            }
        )
    }
}

// MARK:- Body
public extension VSquareButton {
    var body: some View {
        VBaseButton(
            isDisabled: state.isDisabled,
            action: action,
            onPress: { isPressed = $0 },
            content: { hitBox }
        )
    }
    
    private var hitBox: some View {
        buttonView
            .padding(.horizontal, model.layout.hitBoxSpacingX)
            .padding(.vertical, model.layout.hitBoxSpacingY)
    }
    
    private var buttonView: some View {
        buttonContent
            .frame(dimension: model.layout.dimension)
            .background(backgroundView)
            .overlay(border)
    }
    
    private var buttonContent: some View {
        content()
            .padding(.horizontal, model.layout.contentMarginX)
            .padding(.vertical, model.layout.contentMarginY)
            .opacity(model.colors.foregroundOpacity(state: internalState))
    }
    
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: model.layout.cornerRadius)
            .foregroundColor(model.colors.backgroundColor(state: internalState))
    }
    
    @ViewBuilder private var border: some View {
        if model.layout.hasBorder {
            RoundedRectangle(cornerRadius: model.layout.cornerRadius)
                .strokeBorder(model.colors.borderColor(state: internalState), lineWidth: model.layout.borderWidth)
        }
    }
}

// MARK:- Preview
struct VSquareButton_Previews: PreviewProvider {
    static var previews: some View {
        VSquareButton(action: {}, title: "Press")
            .padding()
    }
}