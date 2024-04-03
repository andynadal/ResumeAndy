//
//  String+Sha256Extension.swift
//  ResumeUtilities
//
//  Created by Andy Nadal on 03/04/24.
//

import Foundation
import CommonCrypto

public extension String {
    var sha256: String {
        func process(pointer: UnsafeRawBufferPointer) throws -> UnsafeMutablePointer<UInt8>? {
            CC_SHA256(pointer.baseAddress, CC_LONG(data.count), &digest)
        }
        
        // swiftlint:disable:next force_unwrapping
        let data = self.data(using: .utf8)!
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        do {
            _ = try data.withUnsafeBytes(process(pointer:))
        } catch {}
        
        return digest.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
