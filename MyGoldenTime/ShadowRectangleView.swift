//
//  ShadowRectangleView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/02.
//

import SwiftUI

struct ShadowRectangleView: View {
    @State var cgSize: CGSize
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: cgSize.width, height: cgSize.height)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct ShadowRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowRectangleView(cgSize: CGSize(width: 300, height: 300))
    }
}
