import UIKit
import Firebase

class PasswordHandler: Password {
//    static func featchNesPosts(limit: Int, completion: @escaping ([Post], NSError?) -> Void) {
//        let db = Firestore.firestore()
//        db.collection(name).order(by: createdAt, descending: true).limit(to: limit).getDocuments { (querySnapshot, error) in
//          
//        }
//    }
//    
//    static func featchUserPosts(uid: String, completion: @escaping ([Post], NSError?) -> Void) {
//        let db = Firestore.firestore()
//        db.collection(name).whereField(Post.uid, isEqualTo: uid).order(by: createdAt, descending: true).limit(to: 50).getDocuments { (querySnapshot, error) in
//            var posts: [Post] = []
//            if let error = error {
//                print("Error getting documents: \(error)")
//                completion(posts, error as NSError)
//                return
//            }
//            
//            for document in querySnapshot!.documents {
//                let post = Post(id: document.documentID, document: document)
//                posts.append(post)
//            }
//            completion(posts, nil)
//        }
//    }
//    
//    static func featchPost(postId: String, completion: @escaping (Post?, NSError?) -> Void) {
//        let db = Firestore.firestore()
//        
//        let docRef = db.collection(name).document(postId)
//        docRef.getDocument { (document, error) in
//            if let error = error {
//                completion(nil, error as NSError)
//                return
//            }
//            
//            guard let document = document, document.exists else {
//                completion(nil, nil)
//                return
//            }
//            
//            let post = Post(id: document.documentID, document: document)
//            completion(post, nil)
//            return
//        }
//    }
}
