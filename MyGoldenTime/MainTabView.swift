//
//  MainTabView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/01.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            InputStateView()
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("상태입력")
                }
            
            Text("차트 뷰")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("차트")
                }
            
            Text("기록 뷰")
                .tabItem {
                    Image(systemName: "doc")
                    Text("기록")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
