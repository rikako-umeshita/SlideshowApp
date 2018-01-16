//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 梅下理香子 on 2018/01/10.
//  Copyright © 2018年 rikako.umeshita. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //拡大したスライドショーエリア
    @IBOutlet weak var expansionSlideshow: UIImageView!
    
    
    @IBOutlet weak var returnSegueButton: UIButton!
    
    //値を受け取るための変数
    var receiveView : UIImage!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //拡大view上に表示
       expansionSlideshow.image = receiveView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
