//
//  ViewController.swift
//  Swift+Alamofire
//
//  Created by Caio Sanchez Christino on 30/11/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let countriesClient = APIClient.countriesAPIClient()
        
        _ = countriesClient.countryWithName(name: "brasil")
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                print(event)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

