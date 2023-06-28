//
//  ContentView.swift
//  I am rich swiftui
//
//  Created by Thomas Bernard on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal).ignoresSafeArea(.all)
            
            VStack {
                Text("I am rich")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
