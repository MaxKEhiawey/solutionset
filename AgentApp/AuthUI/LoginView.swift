//
//  LoginView.swift
//  AgentApp
//
//  Created by AMALITECH MACBOOK on 30/07/2023.
//

import SwiftUI

struct LoginView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isEight = false
    @State private var hasCapital = false
    @State private var hasSmallLetter = false
    @State private var hasNumber = false
    @State private var hasSpecialCharacter = false

    var body: some View {
        VStack {
            Image("logo") // Replace "logo" with the name of your logo image asset
                .resizable()
                .frame(width: 100, height: 100)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .onChange(of: password) { newText in
                    checkPasswordRequirements(newText)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            VStack(alignment: .leading) {

                Text("8 characters minimum")
                    .foregroundColor(isEight ? .green: .red)
                Text("one number")
                    .foregroundColor(hasNumber ? .green: .red)
                Text("one uppercase character")
                    .foregroundColor(hasCapital ? .green: .red)
                Text("one lower character")
                    .foregroundColor(hasSmallLetter ? .green: .red)
                Text("one special character")
                    .foregroundColor(hasSpecialCharacter ? .green: .red)
            }
            .font(.caption)

            Button(action: {

            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()

            Spacer()
        }
        .padding()
    }

    func checkPasswordRequirements(_ input: String) {
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let lowercaseLetters = CharacterSet.lowercaseLetters
        let numbers = CharacterSet.decimalDigits
        let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_-+=~`[]{}|\\:;\"'<>,.?/")

        let uppercaseCount = input.filter { uppercaseLetters.contains(UnicodeScalar(String($0))!) }.count
        hasCapital = uppercaseCount > 0

            // Check for lowercase letters
        let lowercaseCount = input.filter { lowercaseLetters.contains(UnicodeScalar(String($0))!) }.count
        hasSmallLetter = lowercaseCount > 0

            // Check for numbers
        let numbersCount = input.filter { numbers.contains(UnicodeScalar(String($0))!) }.count
        hasNumber = numbersCount > 0

            // Check for special characters
        let specialCharCount = input.filter { specialCharacters.contains(UnicodeScalar(String($0))!) }.count
        hasSpecialCharacter = specialCharCount > 0

        isEight = input.count >= 8

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
