//
//  AboutView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 27/03/24.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("ABOUT-THIS-APP-HEADLINE") {
                    Text("ABOUT")
                }
                Section("FEATURES-HEADLINE") {
                    AboutRow("GRAPH-QL", content: "GRAPH-QL-BODY")
                    AboutRow("LOCALIZATION", content: "LOCALIZATION-BODY")
                    AboutRow("SECRET-OBFUSCATION", content: "SECRET-OBFUSCATION-BODY")
                    AboutRow("CONCURRENT-PROGRAMMING", content: "CONCURRENT-PROGRAMMING-BODY")
                    AboutRow("FRAMEWORK-BASED-PROGRAMMING", content: "FRAMEWORK-BASED-PROGRAMMING-BODY")
                    AboutRow("MVVM-ARCHITECTURE", content: "MVVM-ARCHITECTURE-BODY")
                }
            }
            .navigationTitle("ABOUT-TITLE")
        }
    }
}

private struct AboutRow: View {
    let headline: LocalizedStringKey
    let content: LocalizedStringKey
    
    init(_ headline: LocalizedStringKey, content: LocalizedStringKey) {
        self.headline = headline
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(headline)
                .font(.headline)
            Text(content)
        }
    }
}

#Preview {
    AboutView()
}
