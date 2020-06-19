//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 鬼頭和孝 on 2020/06/18.
//  Copyright © 2020 kazutaka.kitou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    // タイマー
    var timer: Timer!
    
    //最初に表示されている画像の設定
    var imageIndex = 0

    //表示する画像の配列定義
    let images: [UIImage] = [UIImage(named:"kani.jpg")!, UIImage(named:"ramen.jpg")!, UIImage(named:"uni.jpg")!]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        imageView.image = images[imageIndex]
    }

    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func next(_ sender: Any) {
            if imageIndex == 2 {
                imageIndex = 0
            } else {
                imageIndex += 1
            }
            imageView.image = images[imageIndex]
        }

    @IBAction func back(_ sender: Any) {
            if imageIndex == 0 {
                imageIndex = 2
            } else {
                imageIndex -= 1
            }
            imageView.image = images[imageIndex]
        }

    @IBAction func start_pause(_ sender: Any) {
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
                
                    (sender as AnyObject).setTitle("停止", for: .normal)
                    nextButton.isEnabled = false
                    backButton.isEnabled = false
                
            } else if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil

                (sender as AnyObject).setTitle("再生", for: .normal)
                nextButton.isEnabled = true
                backButton.isEnabled = true
            }
        }
            
        @objc func onTimer(_ timer: Timer) {
            if imageIndex == 2 {
                imageIndex = 0
            } else {
                imageIndex += 1
            }
            imageView.image = images[imageIndex]
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
//         if (segue.identifier == "ResultViewController"){

            let resultViewController: ResultViewController = (segue.destination as? ResultViewController)!

//            let imagename = images[imageIndex]
//            let nawimage = UIImage(named: imagename)
            
//            let imagename = images[imageIndex]
            resultViewController.selectedImage = images[imageIndex]
//         }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
}

