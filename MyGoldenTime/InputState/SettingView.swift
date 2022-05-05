//
//  SettingView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/03.
//

import SwiftUI

struct SettingView: View {
    
    @State private var isAlert = true
    
    @State private var bedTime = Date()
    @State private var wakeupTime = Date()

    var body: some View {
        GeometryReader { proxy in
            VStack {
                VStack(alignment: .center, spacing: 20) {
                    Toggle(isOn: $isAlert) {
                        Text("알림")
                            .fontWeight(.bold)
                    }
                    
                    DatePicker(selection: $bedTime, displayedComponents: [.hourAndMinute]) {
                        Text("취침 시간")
                            .fontWeight(.bold)
                    }
                    
                    DatePicker(selection: $wakeupTime, displayedComponents: [.hourAndMinute]) {
                        Text("기상 시간")
                            .fontWeight(.bold)
                    }
                } // VStack
                .padding(20)
                .frame(width: proxy.size.width - 40, height: 200)
                .background()
                .cornerRadius(20)
                .shadow(color: .gray, radius: 10, x: 5, y: 5)
                .padding(.vertical, 20)
                .navigationTitle("설정")
                
                Divider().opacity(0)
            }
        } // GeometryReader
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
