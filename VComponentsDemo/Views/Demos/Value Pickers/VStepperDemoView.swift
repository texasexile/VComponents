//
//  VStepperDemoView.swift
//  VComponentsDemo
//
//  Created by Vakhtang Kontridze on 19.12.20.
//

import SwiftUI
import VComponents

// MARK:- V Stepper Demo View
struct VStepperDemoView: View {
    // MARK: Properties
    static let navigationBarTitle: String = "Stepper"
    
    @State private var value: Int = 5
    @State private var state: VStepperState = .enabled
}

// MARK:- Body
extension VStepperDemoView {
    var body: some View {
        VBaseView(title: Self.navigationBarTitle, content: {
            DemoView(component: component, settingsSections: settings)
        })
    }
    
    private func component() -> some View {
        VSliderDemoView.sliderRowView(title: .init(value), content: {
            VStepper(
                range: 1...10,
                state: state,
                value: $value
            )
        })
    }
    
    @ViewBuilder private func settings() -> some View {
        VSegmentedPicker(selection: $state, headerTitle: "State")
    }
}

// MARK:- Helpers
extension VStepperState: VPickableTitledItem {
    public var pickerTitle: String {
        switch self {
        case .enabled: return "Enabled"
        case .disabled: return "Disabled"
        }
    }
}

// MARK:- Preview
struct VStepperDemoView_Previews: PreviewProvider {
    static var previews: some View {
        VStepperDemoView()
    }
}
