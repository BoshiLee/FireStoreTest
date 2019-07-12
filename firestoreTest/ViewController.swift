//
//  ViewController.swift
//  firestoreTest
//
//  Created by Boshi on 2019/7/12.
//  Copyright © 2019 Boshi. All rights reserved.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var passLabel: UILabel!
    lazy var viewModel: ViewModel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindDatas()
    }
        
    func bindDatas() {
        self.viewModel.student.valueChanged = { [weak self] in
            guard let self = self else { return }
            self.passLabel.text = String($0.passClass)
        }

    }


}

