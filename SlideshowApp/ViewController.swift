//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 梅下理香子 on 2018/01/10.
//  Copyright © 2018年 rikako.umeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stopButton: UIButton!
    //ボタンの名前を変える
    stopButton.setTitle("停止", for: .nomal)
    
    
    
    //イメージビューエリアを結びつける
    @IBOutlet weak var slideShow: UIImageView!
    // imageViewにタグ付け
    

    
    
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    
    //画像の配列
    let photos = ["aori.jpg", "boy.jpg","2017080214504000-C616B031331154665D639EF16DA76BC0.jpg", "splatoon2_my_photo.jpg", "kumasansyoukai_gear_rare.jpg"]
    
    //配列番号の変数
    var arrayNumber = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //戻るボタンの動き
    @IBAction func returnButton(_ sender: Any) {
    
        //1つ後ろの画像を読み込む
        arrayNumber -= 1
        
        let image:UIImage! =  UIImage(named: photos[arrayNumber])
        slideShow.image = image
        
        //最初の画像に戻ったら、最後の画像を読み込む
        if arrayNumber < 0 {
            arrayNumber = 4
            let image:UIImage! =  UIImage(named: photos[arrayNumber])
            slideShow.image = image
        }
        //タイマー動いてたらボタンタップ不可
        if timer != nil{
            returnButton.enabled = false
        }
            }
   
    
    //進むボタンの動き
    @IBAction func cueButton(_ sender: Any) {
        arrayNumber += 1
        let image:UIImage! =  UIImage(named: photos[arrayNumber])
        slideShow.image = image
        
        //最後だったら、最初の画像を読み込む
        if arrayNumber < 4 {
            arrayNumber = 0
            let image:UIImage! =  UIImage(named: photos[arrayNumber])
            slideShow.image = image
        }
        
        //タイマー動いてたらボタンタップ不可
        if timer != nil{
            cueButton.enabled = false
        }
    }
        
    //再生ボタンの動き
    @IBAction func startButton(_ sender: Any) {
        
       
         //再生ボタンを押すとタイマー作成・始動
        @objc func startButton(timer: Timer) {
            self.timer_sec += 2
            //画像を読み込む
            arrayNumber += 1
            let image:UIImage! =  UIImage(named: photos[arrayNumber])
            slideShow.image = image
 
        }
        //タイマーを1つに保つ
        if self.timer == nil{
             self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()
            self.timer_sec = nil
            
        }

    }
    
    
}
