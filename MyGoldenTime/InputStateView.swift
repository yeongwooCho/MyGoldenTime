//
//  InputStateView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/02.
//

import SwiftUI

struct InputStateView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("!23")
 
                VStack {
                    Text("asdf")
                    Text("asdf")
                } // VStack
                
                VStack {
                    HStack {
                        Text("에너지 상태")
                        Text("asdf")
                    } // HStack
                    HStack {
                        Text("집중력 상태")
                        Text("asdf")
                    } // HStack
                } // VStack
            } // VStack
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: Text("설정")) {
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                            .foregroundColor(.black)

                    }
                }
            }
        } // NavigationView
    }
}

struct InputStateView_Previews: PreviewProvider {
    static var previews: some View {
        InputStateView()
    }
}
