//
//  NetworkingError.swift
//  ResumeNetworking
//
//  Created by Andy Nadal on 13/03/24.
//

import Foundation

public enum NetworkingError: Error {
    case queryWithoutData
    case caughtError(Error)
}
