//
//  Tag.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 26/03/24.
//

import Foundation

public struct Tag: Decodable, Identifiable {
    public let id: String
    public let title: String
    public let url: URL
}
