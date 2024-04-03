//
//  ExperiencesView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 25/03/24.
//

import SwiftUI

struct ExperiencesView: View {
    @StateObject var viewModel = ExperiencesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if let experiences = viewModel.experiences {
                    ForEach(experiences) { experience in
                        Text(experience.title ?? "")
                    }
                }
            }
        }
        .task {
            await viewModel.fetchExperiences()
        }
    }
}

#Preview {
    ExperiencesView()
}
