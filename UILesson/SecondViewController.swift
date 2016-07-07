//
//  SecondViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2016/07/07.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

//iOSのライブラリをインポート
import UIKit

//UIPickerViewDelegate ---- UIPickerの動作を決めるプロトコル
//UIPickerViewDataSource -- UIPickerで使用するデータを決める処理を用意するためのプロトコル
class SecondViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    //画面を読み込んだ時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //メモリ確保に失敗した時に実行されるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Picker用メソッドの実装（次回実装してもらう）
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)-\(component)";
    }

    
}
