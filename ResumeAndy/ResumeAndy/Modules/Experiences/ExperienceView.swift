//
//  ExperienceView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 25/03/24.
//

import ResumeNetworking
import SwiftUI

struct ExperienceView: View {
    @StateObject var viewModel = ExperiencesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if let experiences = viewModel.experiences {
                    ForEach(experiences) { experience in
                        Section {
                            ExperienceRow(experience: experience)
                        }
                    }
                }
            }
            .navigationTitle("EXPERIENCE-TITLE")
            .task {
                await viewModel.fetchExperiences()
            }
        }
    }
}

private struct ExperienceRow: View {
    let experience: GetExperiences.Output
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            HStack {
                Text(experience.title)
                    .font(.headline)
                if let company = experience.company {
                    Spacer()
                    Text(company)
                        .font(.subheadline)
                }
            }
            HStack {
                Text(experience.startDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                Text(verbatim: "|")
                    .font(.caption)
                if let endDate = experience.endDate {
                    Text(endDate.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                } else {
                    Text("PRESENT")
                        .font(.caption)
                }
            }
            if !experience.investors.isEmpty {
                Divider()
                Text("INVESTORS")
                    .font(.subheadline)
                HStack {
                    ForEach(experience.investors) { investor in
                        InvestorChip(tag: investor)
                    }
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: 8.0) {
                ForEach(experience.paragraph, id: \.self) { string in
                    Text(string)
                }
            }
            Divider()
            Button {
                UIApplication.shared.open(experience.url)
            } label: {
                Text(experience.url.absoluteString)
            }
        }
        .buttonStyle(.borderless)
    }
}

private struct InvestorChip: View {
    let tag: Tag
    
    var body: some View {
        Button {
            UIApplication.shared.open(tag.url)
        } label: {
            Text(tag.title)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5.0)
                .background(
                    RoundedRectangle(cornerRadius: 4.0)
                )
        }
    }
}

#Preview {
    ExperienceView()
}
