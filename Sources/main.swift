import Foundation
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
