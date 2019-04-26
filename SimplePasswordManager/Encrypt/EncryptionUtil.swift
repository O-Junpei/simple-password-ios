import UIKit
import CryptoSwift

// Reference: https://qiita.com/ochim/items/4690cdc5e7fde9ad1b45
class EncryptionUtil {
    
    // ----- encryption -----
    // key:鍵 32 文字
    // iv:初期化ベクトル
    // target:暗号化する文字列
    static func encrypt(key: String, iv: String, target:String) -> String? {
        
        do {
            // AES-256
            let aes = try AES(key: key, iv: iv)
            let cipherArray = try aes.encrypt(Array(target.utf8))
            
            // return cipherArray.toHexString()
            
            // [UInt8]をbase64Stringに変換して返す
            let data = NSData(bytes: cipherArray, length: cipherArray.count)
            let base64Data = data.base64EncodedData(options: [])
            let base64String = String(data: base64Data as Data, encoding: String.Encoding.utf8)
            return base64String
        } catch {
            return nil
        }
    }
    
    // ----- decryption -----
    // key:鍵
    // iv:初期化ベクトル
    // base64:復号する文字列、base64エンコードされている
    static func decrypt(key: String, iv: String, base64:String) -> String? {
        
        do {
            let aes = try AES(key: key, iv:iv)
            
            // 対象をbase64Decodeしてから、[UInt8]に変換する
            // base64 -> Data
            let aData = base64.data(using: String.Encoding.utf8)! as Data
            // Decode base64
            let dData = NSData(base64Encoded: aData, options: [])
            guard let data = dData else {
                return nil
            }
            // dataのバイト数と同じ大きさの配列を作る。
            var aBuffer = Array<UInt8>(repeating: 0, count: data.length)
            // aBufferにバイナリデータを格納。
            data.getBytes(&aBuffer, length: data.length)
            
            
            let decrypted = try aes.decrypt(aBuffer)
            let string = String(data: Data(decrypted), encoding: .utf8)
            return string
        } catch {
            return nil
        }
    }
    
    // ----- Initialization Vector -----
    static func getInitializationVector() -> String {
        let s = randomString(length: 16)
        return s
    }
    
    static func randomString(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let l = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(l)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
}
