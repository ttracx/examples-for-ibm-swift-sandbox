import Foundation

print("\r\n--------------------------------------------")
print("SwiftyJSON")
print("--------------------------------------------")

import SwiftyJSON

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

print("\r\n--------------------------------------------")
print("Cryptor")
print("--------------------------------------------")

import Cryptor

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


print("\r\n--------------------------------------------")
print("HeliumLogger")
print("--------------------------------------------")

import HeliumLogger
import LoggerAPI

let logger = HeliumLogger()
Log.logger = logger

Log.verbose("This is a verbose log message.")

Log.info("This is an informational log message.")

Log.warning("This is a warning.")

Log.error("This is an error.")

Log.debug("This is a debug message.")

let type = LoggerMessageType.info
logger.log(type, msg: "This a dynamic message", functionName: "no func", lineNum: #line, fileName: #file)

print("\r\n--------------------------------------------")
print("Kitura")
print("--------------------------------------------")

import Kitura

let router = Router()

router.get("/") {
request, response, next in
    response.send("Hello, World!")
    next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
