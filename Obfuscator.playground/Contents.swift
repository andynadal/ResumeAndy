import Foundation
import CommonCrypto

public final class Obfuscator {
    
    private var salt: String
    
    public init(with salt: String) {
        self.salt = salt
    }
    
    public func bytesByObfuscatingString(string: String) -> [UInt8] {
        let text = [UInt8](string.utf8)
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var encrypted = [UInt8]()
        
        for t in text.enumerated() {
            encrypted.append(t.element ^ cipher[t.offset % length])
        }
        
        return encrypted
    }
    
    public func reveal(key: [UInt8]) -> String {
        let cipher = [UInt8](self.salt.utf8)
        let length = cipher.count
        
        var decrypted = [UInt8]()
        
        for k in key.enumerated() {
            decrypted.append(k.element ^ cipher[k.offset % length])
        }
        
        return String(bytes: decrypted, encoding: .utf8)!
    }
}

public extension String {
    var sha256: String {
        func process(pointer: UnsafeRawBufferPointer) throws -> UnsafeMutablePointer<UInt8>? {
            CC_SHA256(pointer.baseAddress, CC_LONG(data.count), &digest)
        }
        
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

let obfuscator = Obfuscator(with: "3qL7j8JtUvZgF6lYb1DfLb1kdW0aQeMjX8xV7O7bT5N4E0F9nNkU7qP9T0R7W4N".sha256)

// This are the encrypted bytes
print(obfuscator.bytesByObfuscatingString(string: "https://api-us-west-2.hygraph.com/v2/clt7h7rs90sl507utllere8c9/master"))
