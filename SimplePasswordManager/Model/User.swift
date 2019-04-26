import UIKit
import Firebase

class User {
    static let uid = "uid"
    static let encryptedUid = "encrypted_uid"

    
    static let name = "user"
    static let password = "password"

    static let defaultNickname = "ななしさん"
    static let nickname = "nickname"
    static let profile = "profile"
    static let createdAt = "created_at"
    
    var uid: String!
    var encryptedUid: String?

    var nickname: String!
    var profile: String!
    
    init(uid: String, document: DocumentSnapshot) {
        self.uid = uid
        if let encryptedUid = document.get(User.encryptedUid) as? String {
            self.encryptedUid = encryptedUid
        }
    }
    
    init(uid: String, password: String) {
        self.uid = uid
        self.encryptedUid = password
    }
    
//    static func getIconReference(uid: String) -> StorageReference {
//        let storage = Storage.storage()
//        let storageRef = storage.reference()
//        return storageRef.child("user/" + uid + "/icon.png")
//    }
}
