//
//  ContentView.swift
//  Weather-App
//
//  Created by Neev Cohen on 04/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDay = true
    @State private var showCitySearchView = false
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isDay ? Color("SkyBlue") : .gray, bottomColor: isDay ? Color("LightBlue") : .black)
            VStack {
                Text("Tel Aviv, IL")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .center) {
                    Image(systemName: isDay ? "sun.max.fill" : "moon.stars.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("32°")
                        .foregroundColor(.white)
                        .font(.system(size: 72, weight: .medium, design: .default))
                }
                .padding(.bottom, 40)
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(imageSystemName: "cloud.sun.fill", day: "Sun", temperature: 30)
                    WeatherDayView(imageSystemName: "sun.max.fill", day: "Mon", temperature: 27)
                    WeatherDayView(imageSystemName: "cloud.sun.fill", day: "Tue", temperature: 31)
                    WeatherDayView(imageSystemName: "cloud.sun.fill", day: "Wed", temperature: 30)
                }
                
                Spacer()
                
                Button("Search For a City") {
                    showCitySearchView.toggle()
                }
                
        
            }
            .sheet(isPresented: $showCitySearchView) {
                CitySearchSheetView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea(.all)
    }
}
