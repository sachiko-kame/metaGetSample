//
//  Item.swift
//  metatagGetSample
//
//  Created by 水野祥子 on 2019/07/06.
//  Copyright © 2019 sachiko. All rights reserved.
//

import UIKit

struct Item {
    
    let title:String
    let discription:String
    let image:String
    let url:String
    
    init(title:String, discription:String, image:String, url:String){
        self.title = title
        self.discription = discription
        self.image = image
        self.url = url
    }
}
