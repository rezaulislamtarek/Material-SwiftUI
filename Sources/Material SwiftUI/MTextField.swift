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
    var color : Color
    var cornerRadious : Float
    @State public var isTapped = false
    
    public init(text: Binding<String>, placeHolder: String, isTapped: Bool = false, color: Color, cornerRadious : Float) {
        self._text = text
        self.placeHolder = placeHolder
        self.isTapped = isTapped
        self.color = color
        self.cornerRadious = cornerRadious
    }
    
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
                .padding(.horizontal)
                
                Rectangle()
                    .fill(isTapped ? Color.accentColor : Color.gray).opacity(isTapped ? 1 : 0.5)
                    .frame(height: 1)
                    .padding(.top, 1)
                
            })
            .padding(.top,12)
            
            .background(color.opacity(0.09))
            .cornerRadius(CGFloat(cornerRadious))
        }
    }
}

@available(iOS 15.0.0, *)
struct MTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        MTextField(text: .constant(""), placeHolder: "Enter text", color: Color.gray, cornerRadious: 4.0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



