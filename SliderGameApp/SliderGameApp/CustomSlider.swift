//
//  CustomSlider.swift
//  SliderGameApp
//
//  Created by Тадевос Курдоглян on 19.09.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
    @Binding var currentValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.setValue(Float(currentValue), animated: false)
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        slider.addTarget(context.coordinator, action: #selector(Coordinator.sliderValueDidChange(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
    }
    
    
    
    

}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(currentValue: .constant(50))
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueDidChange(_ sender:UISlider!) {
            currentValue = Double(sender.value)
            
            }
        }
}

