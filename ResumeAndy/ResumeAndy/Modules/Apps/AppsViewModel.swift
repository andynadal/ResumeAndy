//
//  AppsViewModel.swift
//  ResumeAndy
//
//  Created by Andy Nadal on 26/03/24.
//

import ResumeNetworking
import SwiftUI

final class AppsViewModel: ObservableObject {
    @Published var apps: [GetApps.Output]?
    
    @MainActor
    func fetchApps() async {
        do {
            apps = try await URLSession.shared.performQuery(GetApps())
        } catch {
            print("Error", error)
        }
    }
    
    static func fetchImage(for url: URL) async throws -> UIImage? {
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
}
