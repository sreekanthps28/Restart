//
//  HomeView.swift
//  Restart
//
//  Created by SREEKANTH PS on 04/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @AppStorage("onboarding") var isOnBoardingScreenActive = false
    
    //MARK: - Body
    var body: some View {
            VStack{
                //MARK: - Header
                Spacer()
                ZStack{
                    MultipleCircleView(shapeColor: .gray, shapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                
                //MARK: - Center
                
                
                Text("""
                         The time that leads to mastery is dependend on the intensity of our focus
                         """)
                .font(.title3)
                .multilineTextAlignment(.center)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .padding()
                
                Spacer()
                //MARK: - Footer
                
                Button {
                    isOnBoardingScreenActive = true
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }//:Button
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)

            }//: VStack
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
