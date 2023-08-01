//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 1/8/23.
//

import SwiftUI
 

@available(iOS 15.0, *)
public struct MSField: View {
    @Binding public var text:String
    public var placeHolder : String
    var color : Color
    var cornerRadious : Float
    @State public var isTapped = false
    @State var showPassword : Bool = false
    
    public init(text: Binding<String>, placeHolder: String, isTapped: Bool = false, color: Color, cornerRadious : Float) {
        self._text = text
        self.placeHolder = placeHolder
        self.isTapped = isTapped
        self.color = color
        self.cornerRadious = cornerRadious
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            Text(placeHolder)
                .font(.system(isTapped ? .title3 : .title2, design: .rounded))
                .foregroundColor(isTapped ? .accentColor : .black.opacity(0.5))
                .padding(.horizontal, isTapped ? 10 : 0)
                .background(.white)
                .offset(y: isTapped ? -28 : 0)
                .offset(x: isTapped ? -8 : 0)
                .scaleEffect(isTapped ? 0.8 : 1, anchor: .leading)
            
            if showPassword {
                Text(text)
            } else {
                SecureField("", text: $text, onCommit: {isTapped = false})
                    .onTapGesture {
                        withAnimation(.easeIn){
                            isTapped = true
                        }
                    }
                    .onSubmit {
                        if text == "" {
                            withAnimation(.easeOut){
                                isTapped = false
                            }
                        }
                    }
                .font(.system(.title2, design: .rounded))
            }

            
            
            HStack{
                Spacer()
                Image(systemName:  showPassword ? "eye" : "eye.slash.fill").onTapGesture {
                    showPassword.toggle()
                }
            }
            
            
            
        }
        // For ZStack
         
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(
            RoundedRectangle(cornerRadius: CGFloat(cornerRadious))
                .stroke(isTapped ? Color.accentColor : Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}
    
    @available(iOS 15.0.0, *)
    struct MSField_Previews: PreviewProvider {
        
        static var previews: some View {
            MSField(text: .constant(""), placeHolder: "Enter text", color: Color.white, cornerRadious: 10.0)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
