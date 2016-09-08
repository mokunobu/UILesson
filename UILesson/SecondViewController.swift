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
    
    @IBOutlet weak var selectItem:UILabel?;
    @IBOutlet weak var picker:UIPickerView?;
    @IBOutlet weak var baseView:UIView?;

    
    var pickerDataList:[[String]] = [
        ["a","b","c"],
        ["d","e"],
        ["f","g","h","i"],
    ];
    
    //画面を読み込んだ時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView?.hidden=true;
    }
    
    //メモリ確保に失敗した時に実行されるメソッド
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Picker用メソッドの実装（次回実装してもらう）
    //項目の数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        //return 4;
        //配列の要素数から項目数を導き出す
        return pickerDataList.count;
    }
    
    //対象項目のアイテム数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return 3;
        //対象項目の要素数からアイテム数を導き出す
        return pickerDataList[component].count;
    }
    
    //各アイテムの表示名
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "\(row)-\(component)";
        return "\(pickerDataList[component][row])-\(row)-\(component)";
    }
    
   
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //選択したデータをラベルに表示
        //selectItem?.text = pickerDataList[component][row];
        var rows:[Int] = [Int]();
        for i in 0 ... pickerDataList.count-1 {
            rows.append(pickerView.selectedRowInComponent(i));
        }
        
        var str:String = "";
        for i in 0 ... pickerDataList.count-1 {
            str = "\(str)\(pickerDataList[i][rows[i]])";
        }
        
        selectItem?.text = str;
        
    }
    
    @IBAction func touchShowButton(sender: UIButton) {
        baseView?.hidden = !(baseView?.hidden)!;
    }

}
