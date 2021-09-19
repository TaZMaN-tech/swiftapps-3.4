//
//  CustomSlider.swift
//  SliderGameApp
//
//  Created by Тадевос Курдоглян on 19.09.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue, changeValue: changeValue)
    }
    
    @Binding var currentValue: Double
    @Binding var opacity: Double
    @State var changeValue: ()->Void
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.setValue(Float(currentValue), animated: false)
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(opacity))
        slider.addTarget(context.coordinator, action: #selector(Coordinator.sliderValueDidChange(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(opacity))
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(currentValue: .constant(50), opacity: .constant(1.0), changeValue: {} )
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        @State var changeValue: ()->Void
        
        init(currentValue: Binding<Double>, changeValue: @escaping ()->Void) {
            self._currentValue = currentValue
            self.changeValue = changeValue
        }
        
        @objc func sliderValueDidChange(_ sender:UISlider!) {
            currentValue = Double(sender.value)
            changeValue()
        }
    }
}

