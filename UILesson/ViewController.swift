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
    @IBOutlet weak var swt: UISwitch!;
    
    @IBOutlet weak var lbX: UILabel!;
    @IBOutlet weak var lbY: UILabel!;
    
    @IBOutlet weak var slidX: UISlider!;
    @IBOutlet weak var slidY: UISlider!;
    
    @IBOutlet weak var textField: UITextField!;
    
    @IBOutlet weak var textView: UITextView!;
    
    @IBOutlet weak var imgView: UIImageView!;
    
    @IBOutlet weak var segCon: UISegmentedControl!;
    
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
        
        
        //テキストフィールドの調整
        textField.text = "abcdefあいう";
        textField.placeholder = "何か入力";
        textField.textColor = UIColor.blueColor();
        textField.backgroundColor = UIColor.magentaColor();
        textField.textAlignment = NSTextAlignment.Center;
        textField.font = UIFont.systemFontOfSize(25);
        textField.keyboardType = UIKeyboardType.EmailAddress;
        textField.returnKeyType = UIReturnKeyType.Send;
        textField.addTarget(self,
                            action: #selector(ViewController.textFieldDidEndOnExit(_:)),
                            forControlEvents: UIControlEvents.EditingDidEnd);
        
        //TextViewの調整
        //基本的にはテキストフィールドと同じ
        //中身を編集可能か設定できる
        //textView.editable = false;  //編集不可能
        textView.editable = true;  //編集可能
        
        //ImageViewの調整
        //画像はUIImage型で管理される
        let img:UIImage = UIImage(named:"harinezumi.jpeg")!;
        imgView.image = img;
        imgView.contentMode = UIViewContentMode.ScaleAspectFill;
        
        //SegmentedControlの設定
        //有効無効の変更
        segCon.enabled=false;
        //項目中の文字の変更
        segCon.setTitle("a", forSegmentAtIndex: 0);
        segCon.setTitle("b", forSegmentAtIndex: 1);
        //項目の追加
        segCon.insertSegmentWithImage(UIImage(named:"email-ico.png"), atIndex: 1, animated: true);
        segCon.insertSegmentWithTitle("C", atIndex: segCon.numberOfSegments, animated: true);
        segCon.insertSegmentWithTitle("D", atIndex: segCon.numberOfSegments, animated: true);
        
        
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
        
        //スライダーの値が一定より大きくなったらSegmentedControlの選択を変更する
        if(sender.value > 60){
            segCon.selectedSegmentIndex=3;
            segCon.insertSegmentWithTitle("add", atIndex: 3, animated: false);
            segCon.enabled = true;
        }
    }
    
    //X用スライダーの値が変わった時
    @IBAction func changeValueSlidY(sender: UISlider) {
        lbY.text="y=\(sender.value)";
        //スライダーの値が一定より大きくなったらSegmentedControlの選択を解除する
        if(sender.value > 60){
            segCon.selectedSegmentIndex = UISegmentedControlNoSegment;
            segCon.removeSegmentAtIndex(3, animated: true);
        }
    }
    
    @IBAction func textFieldDidEndOnExit(sender: UITextField) {
    }
    
    
    
    @IBAction func btnTouch(sender: UIButton) {
        textField.resignFirstResponder();
    }
    @IBAction func textFieldEnd(sender: AnyObject) {
        textField.resignFirstResponder();
    }
    
    @IBAction func changeValueSegment(sender: UISegmentedControl) {
        // 選択中の項目番号を取得
        var no:Int = sender.selectedSegmentIndex;
        switch(no) {
        case 0:
            textField.text = "one";
        case 1:
            textField.text = "two";
        default:
            textField.text = "none";
        }
        
    }
}








