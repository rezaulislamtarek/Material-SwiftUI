//
//  SwiftUIView.swift
//  
//
//  Created by Rezaul Islam on 1/8/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct MSField: View {
    @Binding public var text: String
    public var placeHolder: String
    var color: Color
    var cornerRadius: Float
    @State public var isTapped = false
    @State private var showPassword = false // Step 1: Add showPassword state

    public init(text: Binding<String>, placeHolder: String, isTapped: Bool = false, color: Color, cornerRadius: Float) {
        self._text = text
        self.placeHolder = placeHolder
        self.isTapped = isTapped
        self.color = color
        self.cornerRadius = cornerRadius
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

            if showPassword { // Step 2: Use SecureField for password input
                SecureField("", text: $text)
                    .font(.system(.title2, design: .rounded))
            } else {
                TextField("", text: $text)
                    .font(.system(.title2, design: .rounded))
            }
            
            // Step 3: Add a button to toggle showPassword state
            HStack{
                Spacer()
                Button(action: {
                    showPassword.toggle()
                }){
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(showPassword ? .accentColor : .black.opacity(0.5))
                }
            }
             
            
        }
        // For ZStack
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(isTapped ? Color.accentColor : Color.gray.opacity(0.5), lineWidth: 1)
        )
    }
}

@available(iOS 15.0.0, *)
struct MSField_Previews: PreviewProvider {

    static var previews: some View {
        MSField(text: .constant(""), placeHolder: "Enter text", color: Color.white, cornerRadius: 10.0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
