//
//  AppsView.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 26/03/24.
//

import ResumeNetworking
import SwiftUI

struct AppsView: View {
    @StateObject var viewModel = AppsViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                if let apps = viewModel.apps {
                    ForEach(apps) { app in
                        Section {
                            AppRow(app: app)
                        }
                    }
                }
            }
            .navigationTitle("APPS-TITLE")
            .task {
                await viewModel.fetchApps()
            }
        }
    }
}

private struct AppRow: View {
    @State private var image: UIImage?
    let app: GetApps.Output

    var body: some View {
        VStack(spacing: 10.0) {
            HStack(alignment: .top, spacing: 12.0) {
                if let imageToShow {
                    Image(uiImage: imageToShow)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50.0, height: 50.0)
                        .accessibilityLabel(Text("APP-ICON"))
                }
                VStack(alignment: .leading) {
                    Text(app.title)
                        .font(.headline)
                    Text(app.developer)
                        .font(.subheadline)
                    Text(app.about)
                }
                Spacer()
            }
            Divider()
            Button {
                UIApplication.shared.open(app.url)
            } label: {
                Text("GO-TO-APP-STORE")
                    .font(.callout)
            }
        }
        .task {
            await fetchImage()
        }
    }
    
    func fetchImage() async {
        do {
            image = try await AppsViewModel.fetchImage(for: app.icon.url)
        } catch {
            image = nil
        }
    }
    
    private var imageToShow: UIImage? {
        image ?? UIImage(systemName: "square.dashed")
    }
}

#Preview {
    AppsView()
}
