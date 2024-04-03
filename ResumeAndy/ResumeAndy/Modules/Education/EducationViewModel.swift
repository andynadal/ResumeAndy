//
//  EducationViewModel.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 26/03/24.
//

import ResumeNetworking

final class EducationViewModel: ObservableObject {
    @Published var education: [GetEducation.Output]?
    
    @MainActor
    func fetchEducation() async {
        do {
            education = try await URLSession.shared.performQuery(GetEducation())
        } catch {
            print("Got error fetching education", error)
        }
    }
}
