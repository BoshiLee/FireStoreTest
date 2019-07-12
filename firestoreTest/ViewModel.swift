//
//  ViewModel.swift
//  firestoreTest
//
//  Created by Boshi on 2019/7/12.
//  Copyright © 2019 Boshi. All rights reserved.
//

import FirebaseFirestore

class ViewModel {
    
    var studentListener: ListenerRegistration?
    var student: Observable<Student> = .init(.init())
    
    init() {
        self.studentListener = FireBaseQueryManager.queryAndRegisterDocument(collection: "Class", document: "student01", model: Student.self) { (result) in
            switch result {
            case .success(let model):
                self.student.value = model
            case .failure(let error):
                switch error {
                case .nsError(let message):
                    print(message)
                case .dataNotFound:
                    print("dataNotFound")
                case .dataParseFailed:
                    print("dataParseFailed")
                }
            }
        }
    }
    
}
