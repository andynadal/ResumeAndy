//
//  GraphQLOperation.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 25/03/24.
//

import ResumeUtilities
import Foundation

public struct GraphQLOperation: Encodable {
    var operationString: String
    
    private let url = URL(string: Secrets.graphQLURI.get)!
    
    enum CodingKeys: String, CodingKey {
        case variables
        case query
    }
    
    public init(_ operationString: String) {
        self.operationString = operationString
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(operationString, forKey: .query)
    }
    
    func getURLRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(Locale.current.identifier.prefix(2)), forHTTPHeaderField: "gcms-locales")
        request.setValue("Bearer \(Secrets.graphQLToken.get)", forHTTPHeaderField: "Authorization")
        request.httpBody = try JSONEncoder().encode(self)
        
        return request
    }
}

struct GraphQLResult<T: Decodable>: Decodable {
    let object: T?
    let errorMessages: [String]
    
    enum CodingKeys: String, CodingKey {
        case data
        case errors
    }
    
    struct Error: Decodable {
        let message: String
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dataDict = try container.decodeIfPresent([String: T].self, forKey: .data)
        self.object = dataDict?.values.first
        
        var errorMessages: [String] = []
        
        let errors = try container.decodeIfPresent([Error].self, forKey: .errors)
        if let errors = errors {
            errorMessages.append(contentsOf: errors.map { $0.message })
        }
        
        self.errorMessages = errorMessages
    }
}
