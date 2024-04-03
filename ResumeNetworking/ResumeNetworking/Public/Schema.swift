//
//  Schema.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 25/03/24.
//

import Foundation

public protocol Queryable {
    associatedtype Output: Decodable
    
    var operation: GraphQLOperation { get }
}
