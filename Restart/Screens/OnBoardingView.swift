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
    
    @State private var isAnimating:Bool = false
    @State private var imageOffset:CGSize = .zero
    @State private var indicatorOpacity:Double = 1.0
    @State private var imageTitle:String = "Share."
    
    let hapticFeedBack = UINotificationFeedbackGenerator()
    //MARK: - Body
    var body: some View {
     
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all,edges: .all)
            VStack{
                //MARK: - Header
                Spacer()
                VStack(spacing: 0){
                    Text(imageTitle)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .transition(.opacity)
                        .id(imageTitle)
                    Text("""
                         It is not how much we give but how much love we put in to giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    
                }//: Header
                .opacity(isAnimating ? 1:0)
                .offset(y: (isAnimating) ? 0 : -40)
                .animation(Animation.easeInOut(duration: 1), value: isAnimating)
                //MARK: - Center
                ZStack{
                    MultipleCircleView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x:-imageOffset.width)
                        .blur(radius: abs(imageOffset.width)/5)
                        .animation(.easeOut(duration: 1.0), value: imageOffset)
                   
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .offset(x:imageOffset.width*1.5, y:0)
                        .opacity(isAnimating ? 1:0)
                        .rotationEffect(.degrees(imageOffset.width/20))
                        .animation(Animation.easeOut(duration: 0.5), value: isAnimating)
                        .gesture(
                        DragGesture()
                            .onChanged{ gesture in
                                if abs(gesture.translation.width) < 150{
                                    imageOffset = gesture.translation
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 0.0
                                        imageTitle = "Give."
                                    }
                                }
                            }
                            .onEnded{_ in
                                imageOffset = .zero
                                withAnimation(.linear(duration: 0.25)){
                                    indicatorOpacity = 1.0
                                    imageTitle = "Share."
                                }
                            }
                        )//: Gesture
                        .animation(.easeInOut(duration: 1.0), value: imageOffset)
                        
                }//: Center
                .overlay(alignment: .bottom, content: {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .offset(y:20)
                        .foregroundColor(.white)
                        .opacity(isAnimating ? 1:0)
                        .animation(.easeOut(duration: 1.0).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                })
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
                                        hapticFeedBack.notificationOccurred(.success)
                                        playSound(sound: "success", type: "m4a")
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
                .opacity(isAnimating ? 1: 0)
                .offset(y: isAnimating ? 0:40)
                .animation(Animation.easeInOut(duration: 1), value: isAnimating)
            } //: VStack
            
            
        }//: ZStack
        .onAppear{
            isAnimating = true
        }
        .preferredColorScheme(.dark)
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
