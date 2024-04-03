//
//  GetEducation.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 26/03/24.
//

import Foundation

public struct GetEducation: Queryable {
    public init() { }
    
    public struct Output: Decodable, Identifiable {
        public let startDate: Date
        public let endDate: Date
        public let title: String
        public let description: String
        public let institution: String
        public let id: String
    }
    
    public var operation: GraphQLOperation {
        GraphQLOperation(
        """
        query Education {
            educations {
                description
                endDate
                id
                institution
                startDate
                title
            }
        }
        """
        )
    }
}
