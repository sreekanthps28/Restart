//
//  ContentView.swift
//  Restart
//
//  Created by SREEKANTH PS on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    
   @AppStorage("onboarding") var isOnBoardingScreenActive = true
    
    //MARK: - Body
    var body: some View {
       ZStack {
           if isOnBoardingScreenActive{
               OnBoardingView()
           }else{
               HomeView()
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
