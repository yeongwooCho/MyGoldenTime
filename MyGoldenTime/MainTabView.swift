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
            Text("1")
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("2")
                .tabItem {
                    Image(systemName: "house")
                }
            
            Text("3")
                .tabItem {
                    Image(systemName: "house")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
