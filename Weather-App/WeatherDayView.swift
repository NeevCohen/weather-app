//
//  WeatherDayView.swift
//  Weather-App
//
//  Created by Neev Cohen on 04/11/2023.
//

import Foundation
import SwiftUI

struct WeatherDayView : View {
    
    let imageSystemName: String
    let day: String
    let temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium, design: .default))
            Image(systemName: imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 32, weight: .medium, design: .default))
        }
    }
}
