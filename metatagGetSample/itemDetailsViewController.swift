//
//  itemDetailsViewController.swift
//  metatagGetSample
//
//  Created by 水野祥子 on 2019/07/06.
//  Copyright © 2019 sachiko. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    var item:Item!
    
    convenience init(item:Item) {
        self.init()
        self.item = item
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.item)
    }
}
