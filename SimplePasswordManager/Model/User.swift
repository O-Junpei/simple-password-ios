import UIKit
import Firebase

class User {
    static let name = "user"
    static let password = "password"

    static let defaultNickname = "ななしさん"
    static let uid = "uid"
    static let nickname = "nickname"
    static let profile = "profile"
    static let createdAt = "created_at"
    
    var uid: String
    var password: String!

    var nickname: String
    var profile: String
    
    init(uid: String, document: DocumentSnapshot) {
        self.uid = uid
        
        if let name = document.get(User.nickname) as? String {
            self.nickname = name
        } else {
            self.nickname = User.defaultNickname
        }
        
        if let profile = document.get(User.profile) as? String {
            self.profile = profile
        } else {
            self.profile = ""
        }
    }
    
//    init(uid: String) {
//        self.uid = uid
//        self.nickname = User.defaultNickname
//        self.profile = ""
//    }
    
//    static func getIconReference(uid: String) -> StorageReference {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        return storageRef.child("user/" + uid + "/icon.png")
//    }
}
