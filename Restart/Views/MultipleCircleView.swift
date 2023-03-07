//
//  MultipleCircleView.swift
//  Restart
//
//  Created by SREEKANTH PS on 05/03/2023.
//

import SwiftUI

struct MultipleCircleView: View {
    @State var shapeColor:Color
    @State var shapeOpacity:Double
    var body: some View {
        ZStack{
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle().stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260,height: 260,alignment: .center)
        }
    }
}

struct MultipleCircleView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleCircleView(shapeColor: .black, shapeOpacity: 0.2)
    }
}
