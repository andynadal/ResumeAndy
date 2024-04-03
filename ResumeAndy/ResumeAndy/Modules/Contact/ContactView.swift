//
//  ContactView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 27/03/24.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button {
                        UIApplication.shared.open(URL(string: "tel:+525543505030")!)
                    } label: {
                        Text(verbatim: "+52 55 4350 5030")
                    }
                    Button {
                        UIApplication.shared.open(URL(string: "mailto:andy@andynadal.com")!)
                    } label: {
                        Text(verbatim: "andy@andynadal.com")
                    }
                }
                Section {
                    Button {
                        UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/andresnadalsosa/")!)
                    } label: {
                        Text(verbatim: "LinkedIn")
                    }
                    Button {
                        UIApplication.shared.open(URL(string: "https://twitter.com/andynadal_")!)
                    } label: {
                        Text(verbatim: "Twitter")
                    }
                    Button {
                        UIApplication.shared.open(URL(string: "https://github.com/andynadal")!)
                    } label: {
                        Text(verbatim: "GitHub")
                    }
                }
            }
            .navigationTitle("CONTACT-TITLE")
        }
    }
}

#Preview {
    ContactView()
}
