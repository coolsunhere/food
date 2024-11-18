//
//  ContentView.swift
//  food
//
//  Created by 周向阳 on 2024/11/12.
//

import SwiftUI

struct ContentView: View {
    let food = ["汉堡", "沙拉", "披萨", "义大利麵", "鸡腿便当", "刀削麵", "火锅", "牛肉麵", "关东煮"]
    @State private var selectedFood: String?
    var body: some View {
        VStack(spacing: 30) {
            Image("dinner")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("你想吃什么呢")
                .bold()
            
            if selectedFood != .none {
                Text(selectedFood ?? "")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .bold()
            }
            
            Button(role: .cancel){
                selectedFood = food.shuffled().filter { $0 != selectedFood }.first
            }label: {
                Text(selectedFood == .none ? "告诉我" : "换一个").frame(width: 200)
            }
            .padding(.bottom, -15)

            Button(role: .cancel){
                selectedFood = .none
            }label: {
                Text("重置").frame(width: 200)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxHeight: .infinity)
        .animation(.easeInOut, value: selectedFood)
        .font(.title)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: 20))
        .controlSize(.large)
        .background(Color(.systemGroupedBackground))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
