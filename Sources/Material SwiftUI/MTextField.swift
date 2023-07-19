//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 19/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct MTextField: View {
    @Binding public var text:String
    public var placeHolder : String
    @State public var isTapped = false
    
    
    
    public var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 4, content: {
                TextField("", text: $text){ status in
                    if status{
                        withAnimation(.easeIn){
                            isTapped = true
                        }
                    }
                } onCommit: {
                        if text == "" { withAnimation(.easeOut){
                            isTapped = false
                        }
                    }
                }
                 
                
                .padding(.top, isTapped ? 15 : 0)
                
                .background(
                    Text(placeHolder)
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x: isTapped ? -7 : 0, y: isTapped ? -16 : 0)
                        .foregroundColor( isTapped ? Color.accentColor : .gray)
                    , alignment: .leading
                )
                
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray).opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 1)
                
            })
            .padding(.top,12)
            .padding(.horizontal,12)
            .background(Color.white.opacity(0.09))
            .cornerRadius(10)
        }
    }
}

@available(iOS 15.0.0, *)
struct MTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        MTextField(text: .constant(""), placeHolder: "Enter text")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



