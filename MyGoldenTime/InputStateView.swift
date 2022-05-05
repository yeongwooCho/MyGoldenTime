//
//  InputStateView.swift
//  MyGoldenTime
//
//  Created by yeongwoocho on 2022/05/02.
//

import SwiftUI

struct InputStateView: View {
    
    @State private var inputWhatTodo = ""
    
    @State private var inputWhyTodo = ""
    
    @State private var seletedEnergyState = 3
    
    @State private var seletedConcentrationState = 3
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                VStack(alignment: .center, spacing: 20.0) {
                    VStack(alignment: .leading, spacing: 10) {
                        Spacer()
                        Text("당신은 지금 무엇을 하고 있나요?")
                            .fontWeight(.bold)
                        TextField("10자 이내로 입력해주세요.", text: $inputWhatTodo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                        Text("왜 그것을 하고 있나요?")
                            .fontWeight(.bold)
                        TextField("10자 이내로 입력해주세요.", text: $inputWhyTodo)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    } // VStack
                    .padding(20)
                    .frame(width: proxy.size.width - 40, height: 200)
                    .background()
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(spacing: 20) {
                            Text("에너지 상태")
                                .fontWeight(.bold)
                            Picker("당신의 상태를 선택하세요", selection: $seletedEnergyState) {
                                ForEach(0...5, id: \.self) { Text("\($0)") }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        } // HStack
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 20) {
                            Text("집중력 상태")
                                .fontWeight(.bold)
                            Picker("당신의 상태를 선택하세요", selection: $seletedConcentrationState) {
                                ForEach(0...5, id: \.self) { Text("\($0)") }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        } // HStack
                        .padding(.horizontal, 20)
                    } // VStack
                    .frame(width: proxy.size.width - 40, height: 140)
                    .background()
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 10, x: 5, y: 5)
                    
                    Button {
                        print(inputWhatTodo)
                        print(inputWhyTodo)
                        print(seletedEnergyState)
                        print(seletedConcentrationState)
                    } label: {
                        Text("입력하기")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: proxy.size.width - 40, height: 50)
                            .background(Color.blue)
                            .cornerRadius(15)
                    }
                    
                    Spacer()
                } // VStack
                .padding(.vertical, 20)
                .navigationTitle("상태 입력")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingView()) {
                            Image(systemName: "gear")
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
            } // NavigationView
            .navigationViewStyle(.stack)
        } // GeometryReader
    }
}

struct InputStateView_Previews: PreviewProvider {
    static var previews: some View {
        InputStateView()
    }
}
