//
//  KeychainService.swift
//  MealHelper
//
//  Created by macbook Denis on 5/30/23.
//
import JWTDecode
import Security
import Foundation

final class KeychainService {
    private let service: String
    static let shared = KeychainService(service: "Meal Helper")

    init(service: String) {
        self.service = service
    }
    
    func saveToken(_ token: String) {
        guard let data = token.data(using: .utf8) else {
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "token",
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("Failed to save token to keychain. Status: \(status)")
        }
    }
    
    func retrieveToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "token",
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let tokenData = result as? Data,
            let token = String(data: tokenData, encoding: .utf8) {
            return token
        }
        
        return nil
    }
    
    func deleteToken() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "token"
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            print("Failed to delete token from keychain. Status: \(status)")
        }
    }
    
    func getUserId() -> Int {
        if let token = retrieveToken() {
            do {
                let jwt = try decode(jwt: token)
                guard let userId = jwt.body["user_id"] as? Int else { return 0 }
                return userId
            } catch {
                print("Failed to decode JWT token: \(error)")
            }
        }
        
        return 0
    }
    
    func isAuth() -> Bool {
        return retrieveToken() != nil
    }
}
