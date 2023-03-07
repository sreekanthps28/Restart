//
//  OnBoardingView.swift
//  Restart
//
//  Created by SREEKANTH PS on 04/03/2023.
//

import SwiftUI

struct OnBoardingView: View {
    
    //MARK: - Properties
    @AppStorage("onboarding") var isOnBoardingScreenActive = true
    
    @State var buttonWidth:Double = UIScreen.main.bounds.width - 80
    @State var buttonOffset:CGFloat = 0
    
    //MARK: - Body
    var body: some View {
     
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            VStack{
                //MARK: - Header
                Spacer()
                VStack(spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Text("""
                         It is not how much we give but how much love we put in to giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                }//: Header
                //MARK: - Center
                ZStack{
                    MultipleCircleView(shapeColor: .white, shapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        
                }//: Center
                Spacer()
                //MARK: - Footer
                ZStack{
                    //Parts of Custom Button
                    // 1. Background(Static)
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    // 2. Call To Action(Static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. Capsule((Dynamic Width))
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }//: HStack
                    // 4. Circle(Dragable)
                    HStack{
                        ZStack{
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(.white)
                                .font(.system(size: 24,weight: .bold))
                        }//: ZStack
                        .offset(x:buttonOffset)
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80,alignment: .center)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if (gesture.translation.width > 0 && gesture.translation.width < buttonWidth - 80) {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{_ in
                                    if buttonOffset > buttonWidth/2{
                                        buttonOffset = buttonWidth - 80
                                        isOnBoardingScreenActive = false
                                    }else{
                                        buttonOffset = 0
                                    }
                                }
                        )//:Gesture
                        
                        Spacer()
                    }//:HStack
                    
                }//:Footer
                .frame(width:buttonWidth, height: 80, alignment: .center)
                .padding()
            } //: VStack
            
        }//: ZStack
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
