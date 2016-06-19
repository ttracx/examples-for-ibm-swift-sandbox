import Foundation
import SwiftyJSON
import Cryptor

func JSONExample() {
    let json = JSON(["name":"naokits", "age": 50])

    if let name = json["name"].string {
        print(name)
    }

    if let age = json["age"].int {
        print(age)
    }
}

JSONExample()

///////////////////////////////////////////////////////////////////////////////

let key = CryptoUtils.byteArray(fromHex: "2b7e151628aed2a6abf7158809cf4f3c")
let iv = CryptoUtils.byteArray(fromHex: "00000000000000000000000000000000")
let plainText = CryptoUtils.byteArray(fromHex: "6bc1bee22e409f96e93d7e117393172a")
print("Plaintext  = " + CryptoUtils.hexString(from: plainText))

var textToCipher = plainText
if plainText.count % Cryptor.Algorithm.aes.blockSize != 0 {
    textToCipher = CryptoUtils.zeroPad(byteArray: plainText, blockSize: Cryptor.Algorithm.aes.blockSize)
}
let cipherText = Cryptor(operation: .encrypt, algorithm: .aes, options: .none, key: key, iv: iv).update(byteArray: textToCipher)?.final()
print("Ciphertext = " + CryptoUtils.hexString(from: cipherText!))

let decryptedText = Cryptor(operation: .decrypt, algorithm: .aes, options: .none, key: key, iv: iv).update(byteArray: cipherText!)?.final()
print("Decrypted  = " + CryptoUtils.hexString(from: decryptedText!))
