//
//  GetExperiences.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 25/03/24.
//

import Foundation

public struct GetExperiences: Queryable {
    public init() { }
    
    public struct Output: Decodable, Identifiable {
        public let startDate: Date
        public let endDate: Date?
        public let id: String
        public let location: String
        public var paragraph = [String]()
        public let title: String
        public let url: URL
        public let company: String?
        public let companyLegalName: String?
        public let investors: [Tag]
    }

    public var operation: GraphQLOperation {
        GraphQLOperation(
        """
            query Experiences {
                experiences {
                    endDate
                    id
                    location
                    paragraph
                    startDate
                    title
                    url
                    company
                    companyLegalName
                    investors {
                        id
                        title
                        url
                    }
                }
            }
        """
        )
    }
}
