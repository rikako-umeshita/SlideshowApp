//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 梅下理香子 on 2018/01/10.
//  Copyright © 2018年 rikako.umeshita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    //イメージビューエリアを結びつける
    @IBOutlet weak var slideShow: UIImageView!
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cueButton: UIButton!
    
    
    var timer: Timer!
    
    
    
    //画像の配列
    let photos = ["aori.jpg", "boy.jpg","2017080214504000-C616B031331154665D639EF16DA76BC0.jpg", "splatoon2_my_photo.jpg", "kumasansyoukai_gear_rare.jpg"]
    
    //配列番号の変数
    var arrayNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrayNumber = 0
        
        let image:UIImage! =  UIImage(named: photos[0])
        slideShow.image = image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //戻るボタンの動き
    
    @IBAction func returnButtonTapped(_ sender: Any) {
        
        //1つ後ろの画像を読み込む
        arrayNumber -= 1
        
        //最初の画像に戻ったら、最後の画像を読み込む
        if arrayNumber < 0 {
            arrayNumber = photos.count - 1
        }
        
        let image:UIImage! =  UIImage(named: photos[arrayNumber])
        slideShow.image = image
    }
    
    //進むボタンの動き
    @IBAction func cueButtonTapped(_ sender: Any) {
        
        //1つ先の画像を読み込む
        arrayNumber += 1
        
        
        //最後だったら、最初の画像を読み込む
        if photos.count == arrayNumber {
            arrayNumber = 0
        }
        
        let image:UIImage! =  UIImage(named: photos[arrayNumber])
        slideShow.image = image
        
    }
    
    //再生ボタンの動き
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        
        //タイマーが止まっているとき
        if self.timer == nil{
            //タイマーを動かす
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            //進む戻るボタンをタップ不可
            cueButton.isEnabled = false
            returnButton.isEnabled = false
            
            //再生ボタンのタイトルを停止にする
            startButton.setTitle("停止", for: .normal)
            
        }
        else{
            //タイマーを止める
            self.timer.invalidate()
            self.timer = nil
            
            //進むもどるボタンをタップ可
            cueButton.isEnabled = true
            returnButton.isEnabled = true
            
            //再生ボタンのタイトルを再生にする
            startButton.setTitle("再生", for: .normal)
            
        }
    }
    
    //再生ボタンを押すとタイマー作成・始動
    @objc func updateTimer(timer: Timer) {
        //画像を読み込む
        arrayNumber += 1
        
        //最後だったら、最初の画像を読み込む
        if photos.count == arrayNumber {
            arrayNumber = 0
        }
        
        let image:UIImage! =  UIImage(named: photos[arrayNumber])
        slideShow.image = image
    }
    
    //画像をタップして画面遷移
    
    @IBAction func viewTapped(_ sender: Any) {
        
    }
    
    //画像の受け渡し
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.receiveView = slideShow.image
        
        //遷移元のタイマーを止める
        self.timer.invalidate()
        self.timer = nil
    }
    

    
    //拡大画面から戻ってくる
    @IBAction func unwind(_ Segue: UIStoryboardSegue) {
    }
    
    
}
