//
//  ExperiencesViewModel.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 25/03/24.
//

import ResumeNetworking

final class ExperiencesViewModel: ObservableObject {
    @Published var experiences: [GetExperiences.Output]?

    @MainActor
    func fetchExperiences() async {
        do {
            experiences = try await URLSession.shared.performQuery(GetExperiences())
        } catch {
            print("Error", error)
        }
    }
}
