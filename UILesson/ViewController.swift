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
    @IBOutlet weak var swt: UISwitch!
    
    @IBOutlet weak var lbX: UILabel!
    @IBOutlet weak var lbY: UILabel!
    
    @IBOutlet weak var slidX: UISlider!
    @IBOutlet weak var slidY: UISlider!
    
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
        
        //Switchの操作
        //Switchの切り替え
        swt.on = false;
        //背景色
        swt.onTintColor = UIColor.blackColor();
        //摘みの色
        swt.thumbTintColor = UIColor.yellowColor();
        
        //スライダーの値を調整
        slidX.minimumValue = 1;
        slidX.maximumValue = 100;
        slidX.value = 70;
        slidY.minimumValue = -100;
        slidY.maximumValue = 100;
        slidY.value = 70;
        
        slidX.continuous=false;
        
        
    }

    //値が変更された時に実行されるアクション
    @IBAction func changeValueSwitch(sender: UISwitch) {
        if(sender.on == true)
        {
            lb.text = "Switch ON!!";
        }
        else
        {
            lb.text = "Switch OFF!!";
        }
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

    //X用スライダーの値が変わった時
    @IBAction func changeValueSlidX(sender: UISlider) {
        let tmp:Int = Int(sender.value);
        sender.value = Float(tmp);
        lbX.text="x=\(sender.value)";
    }
    
    //X用スライダーの値が変わった時
    @IBAction func changeValueSlidY(sender: UISlider) {
        lbY.text="y=\(sender.value)";
    }
    
}

