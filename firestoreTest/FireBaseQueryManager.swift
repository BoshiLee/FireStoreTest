//
//  FireBaseQueryManager.swift
//  firestoreTest
//
//  Created by Boshi on 2019/7/12.
//  Copyright © 2019 Boshi. All rights reserved.
//

import FirebaseFirestore

struct Student: Decodable {
    let passClass: Int
    
    init() {
        self.passClass = 0
    }
}

enum FireError: Error {
    
    case nsError(String)
    case dataNotFound
    case dataParseFailed
}

struct FireBaseQueryManager {
    
    typealias DocSnapShopBlock<T: Decodable> = (Result<T, FireError>) -> Void
    
    private init() { }
    
    static private var db: Firestore = .firestore()
    
    public static func queryAndRegisterDocument<T: Decodable>(collection: String, document: String, model: T.Type, listener: @escaping DocSnapShopBlock<T>) -> ListenerRegistration {
        return db.collection(collection).document(document).addSnapshotListener { (snp, error) in
            guard error == nil else {
                listener(.failure(.nsError(error!.localizedDescription)))
                return
            }
            guard let dict = snp?.data() else {
                listener(.failure(.dataNotFound))
                return
            }
            do {
                let json = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                let decoder = JSONDecoder()
                let model = try decoder.decode(model, from: json)
                listener(.success(model))
            } catch {
                listener(.failure(.dataParseFailed))
            }
            
            
        }
    }
    
}

class Observable<T> {
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    var valueChanged: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
        
        defer {
            self.value = value
        }
    }
}

