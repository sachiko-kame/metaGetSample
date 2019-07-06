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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    convenience init(item:Item) {
        self.init()
        self.item = item

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.item.image != ""){
            let imgURL = URL(string: self.item.image)!
            let session = URLSession(configuration: .default)
            let download = session.dataTask(with: imgURL) { (data, response, error) in
                if (response as? HTTPURLResponse) != nil{
                    if let imageData = data {
                        DispatchQueue.main.async {
                            let imageimage = UIImage(data: imageData)
                            self.imageView.image = imageimage
                        }
                    }
                }
            }
            session.invalidateAndCancel()
            download.resume()
        }
        
        self.label.text = "titleは\(self.item.title)\n, discriptionは\(self.item.discription)\n, image\(self.item.image)\n, urlは\(self.item.url)"
    }
}
