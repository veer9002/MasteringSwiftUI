//
//  RegistrationView.swift
//  MasteringSwiftUI
//
//  Created by Manish  Sharma on 22/04/23.
//

import SwiftUI

struct RegistrationView: View {
//    @State private var username: String = ""
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
    
    @ObservedObject private var userRegistrationViewModel = UserRegistrationViewModel()

    var body: some View {
        
        VStack {
            Text("Create an account")
                .font(.title)
                .bold()
                .padding(.bottom, 30)
            
            FormTextField(fieldName: "Username", fieldValue: $userRegistrationViewModel.username)

            RequirementText(iconColor: userRegistrationViewModel.isUsernameLengthValid ? Color .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid, text: "A minimum of 4 characters")
                .padding()
            
            FormTextField(fieldName: "Password", isSecure: true, fieldValue: $userRegistrationViewModel.password)

            VStack {
                RequirementText(iconName: "lock.open",iconColor: userRegistrationViewModel.isPasswordLengthValid ? Color .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), isStrikeThrough: userRegistrationViewModel.isPasswordLengthValid, text: "A minimum of 8 characters")
                
                RequirementText(iconName: "lock.open",iconColor: userRegistrationViewModel.isPasswordCapitalLetters ? Color .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), isStrikeThrough: userRegistrationViewModel.isPasswordCapitalLetters, text: "Atleast one capital letter")
                
            }
            .padding()
          
            FormTextField(fieldName: "Confirm password", isSecure: true, fieldValue: $userRegistrationViewModel.confirmpassword)
            
            RequirementText(iconColor: userRegistrationViewModel.isUsernameLengthValid ? Color .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), isStrikeThrough: userRegistrationViewModel.isUsernameLengthValid, text: "Your confirm password should be same as Password.")
                .padding()
                .padding(.bottom, 20)

            Button {
                //action
                print("Button Tapped")
            } label: {
                //look and feel
                Text("Sign up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            
            HStack {
                Text("Already have an account?")
                Button {
                    //action
                    print("Button Tapped")
                } label: {
                    //look and feel
                    Text("Sign in")
                        .foregroundColor(.orange)
                }
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


struct FormTextField: View {
    var fieldName: String
    var isSecure = false
    @Binding var fieldValue: String
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            } else {
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(red: 240/255, green: 240/255, blue: 240/255))
                .padding(.horizontal)

        }
    }
}

struct RequirementText: View {
    
    var iconName = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    var isStrikeThrough = false
    var text = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(iconColor)
                
                Text(text)
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                    .strikethrough(isStrikeThrough)

                Spacer()
            }
        }
      
        
    }
}
