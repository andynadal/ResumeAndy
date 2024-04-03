//
//  EducationView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 26/03/24.
//

import ResumeNetworking
import SwiftUI

struct EducationView: View {
    @StateObject var viewModel = EducationViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if let education = viewModel.education {
                    ForEach(education) { education in
                        Section {
                            EducationRow(education: education)
                        }
                    }
                }
            }
            .navigationTitle("EDUCATION-TITLE")
            .task {
                await viewModel.fetchEducation()
            }
        }
    }
}

private struct EducationRow: View {
    let education: GetEducation.Output
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            Text(education.title)
                .font(.headline)
            Text(education.institution)
                .font(.subheadline)
            HStack {
                Text(education.startDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                Text(verbatim: "|")
                    .font(.caption)
                Text(education.endDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
            }
            Divider()
            Text(education.description)
        }
        .buttonStyle(.borderless)
    }
}

#Preview {
    EducationView()
}
