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
    @State private var isAnimating = false
    
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
                        .offset(y:isAnimating ? -35: 35)
                        .animation(Animation.easeInOut(duration: 4)
                            .repeatForever(), value: isAnimating)
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
                    withAnimation{
                        playSound(sound: "chimeup", type: "mp3")
                        isOnBoardingScreenActive = true
                    }
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
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
