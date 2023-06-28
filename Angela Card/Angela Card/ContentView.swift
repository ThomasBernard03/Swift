//
//  ContentView.swift
//  Angela Card
//
//  Created by Thomas Bernard on 28/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Thomas")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Thomas Bernard")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("iOS developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Divider()
                
                InfoView(text: "06 01 02 02 04", imageName: "phone.fill")
                InfoView(text: "test@test.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


