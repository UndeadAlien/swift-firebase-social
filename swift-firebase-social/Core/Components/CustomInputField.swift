//
//  CustomInputField.swift
//  CivilGrooming
//
//  Created by Connor Hutchinson on 8/3/22.
//

import SwiftUI

struct CustomInputField: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    let imageName: String
    let placeholderText: String
    
    var textCase: Text.Case?
    var keyboardType: UIKeyboardType?
    var textContentType: UITextContentType?
    var textInputAutoCapital: TextInputAutocapitalization?
    var isSecureField: Bool? = false
    
    @Binding var text: String
    
    
    var body: some View {
        
        VStack {
            HStack {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                        .textContentType(textContentType != nil ? textContentType : .none)
                }
                else {
                    TextField(placeholderText, text: $text) { _ in
                        text = setTextCase(text: text)
                    }
                    .keyboardType(keyboardType != nil ? keyboardType! : .default)
                    .textContentType(textContentType != nil ? textContentType : .none)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(textInputAutoCapital != nil ? textInputAutoCapital : .none)
                    .onChange(of: text) { newValue in
                        text = setTextCase(text: text)
                    }
                }
            }
            
            Divider()
                .background(isDarkMode ? .white : .black)
        }
        
        
    }
}

#if DEBUG
struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(
            imageName: "envelope",
            placeholderText: "Email",
            isSecureField: false,
            text: .constant("")
        )
    }
}
#endif

extension CustomInputField {
    
    func setTextCase(text: String) -> String {
        if let textCase = textCase {
            if textCase == .uppercase {
                return text.uppercased()
            }
            else if textCase == .lowercase {
                return text.lowercased()
            }
        }
        
        return text
    }
    
}
