//
//  ViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2016/06/02.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet...InterfaceBuilderの部品と繋ぐための変数
    //weak...部品の参照がいつの間にか切れているかもしれないことを表す
    @IBOutlet weak var lb: UILabel!;

    @IBOutlet weak var textBt: UIButton!;
    @IBOutlet weak var imgBt: UIButton!;
    //画面を読み込んだ時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //ラベルの変更
        lb.text="変更しました";
        lb.textColor=UIColor.yellowColor();
        
        lb.font = UIFont.systemFontOfSize(50);
        lb.adjustsFontSizeToFitWidth=true;
        
        //文字ボタンの変更
        textBt.setTitle("Push!", forState: UIControlState.Normal);
        //無効にする
        textBt.enabled=true;
    }

    //メモリ確保に失敗した時に実行されるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //IBAction...InterfaceBuilderの部品のアクションとして繋がっている
    // sender...アクション発生源の部品が入っている
    @IBAction func textBtnTouchUp(sender: UIButton) {
        lb.text = sender.titleLabel!.text;
    }

}

