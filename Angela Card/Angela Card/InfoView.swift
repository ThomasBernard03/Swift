//
//  InfoView.swift
//  Angela Card
//
//  Created by Thomas Bernard on 28/06/2023.
//

import SwiftUI

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "06 01 02 02 04", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}

struct InfoView: View {
    
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 60)
            .padding(.all)
            .overlay(
                HStack{
                    Image(systemName: imageName).foregroundColor(.green)
                    Text(text)
                }
            )
    }
}
