//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 鬼頭和孝 on 2020/06/18.
//  Copyright © 2020 kazutaka.kitou. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var tappedImageView: UIImageView!
    var selectedImage: UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tappedImageView.image = selectedImage

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
