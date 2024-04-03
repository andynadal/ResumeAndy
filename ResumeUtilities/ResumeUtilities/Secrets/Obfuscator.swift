//
//  Obfuscator.swift
//  ResumeUtilities
//
//  Created by Andy Nadal on 03/04/24.
//

import Foundation

enum Obfuscator {
    /**
     This method reveals the original string from the obfuscated
     byte array passed in. The salt must be the same as the one
     used to encrypt it in the first place.
     
     - parameter key: the byte array to reveal
     
     - returns: the original string
     */
    public static func reveal(key: [UInt8]) -> String {
        let salt = "3qL7j8JtUvZgF6lYb1DfLb1kdW0aQeMjX8xV7O7bT5N4E0F9nNkU7qP9T0R7W4N".sha256
        
        let cipher = [UInt8](salt.utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for key in key.enumerated() {
            decrypted.append(key.element ^ cipher[key.offset % length])
        }
        
        // swiftlint:disable:next force_unwrapping
        return String(bytes: decrypted, encoding: .utf8)!
    }
}
