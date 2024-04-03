//
//  GetApps.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 26/03/24.
//

import Foundation

public struct GetApps: Queryable {
    public init() { }
    
    public struct Output: Decodable, Identifiable {
        public let about: String
        public let developer: String
        public let id: String
        public let title: String
        public let url: URL
        public let icon: AppIcon
    }
    
    public var operation: GraphQLOperation {
        GraphQLOperation(
        """
        query Apps {
            apps {
                about
                developer
                id
                title
                url
                icon {
                    url
                }
            }
        }
        """
        )
    }
}
