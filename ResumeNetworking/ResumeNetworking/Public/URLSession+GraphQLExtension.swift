//
//  URLSession+GraphQLExtension.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 25/03/24.
//

import Foundation

extension URLSession {
    func getData(from urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                
                continuation.resume(returning: (data, response))
            }
            
            task.resume()
        }
    }
    
    static let decoder: JSONDecoder = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()
}

public extension URLSession {
    func performQuery<Query: Queryable>(_ query: Query) async throws -> [Query.Output] {
        let request: URLRequest = try query.operation.getURLRequest()
        
        let (data, _) = try await URLSession.shared.getData(from: request)
        
        let json = try JSONSerialization.jsonObject(with: data)
        print("JSON", json)
        
        let result = try URLSession.decoder.decode(GraphQLResult<[Query.Output]>.self, from: data)
        guard let object = result.object else {
            print(result.errorMessages.joined(separator: "\n"))
            throw NSError(domain: "Error", code: 1)
        }
        
        return object
    }
}
