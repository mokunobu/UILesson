//
//  HobbyTableViewController.swift
//  UILesson
//
//  Created by iMac200902 on 2016/10/27.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import UIKit


class HobbyTableViewController : UITableViewController/*, UITableViewDelegate, UITableViewDataSource */ {

    //読み込むxibファイルのファイル名
    let CELL_XIB_FILENAME:String = "HobbyTableCell";
    //読み込んだxibファイルのデータをバッファに登録する際のキー値
    let CELL_ID:String = "HobbyTableCell";
    
    //表示するデータを配列で用意
    var categoryList:[HobbyCategory] = [HobbyCategory]();
    
    //var hobbyList:[HobbyData] = [HobbyData]();
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //TableViewに対する設定
        //TableViewに入れるセルの高さの設定(全てのセルの高さが同じ場合に使用)
        tableView.rowHeight = 92;
        //TableViewに入れるセルのセクション数／項目数を決める処理を書くクラスの指定
        tableView.dataSource = self
        //TableViewに入れられたセルに対してタップなどで操作した時の処理を書くクラスの指定
        tableView.delegate = self
        
        //ヘッダーの高さを指定（全てのヘッダー）
        tableView.sectionHeaderHeight = 100;
        
        //フッターの高さを指定（全てのフッター）
        tableView.sectionFooterHeight = 50;
        
        
        //xibファイルからViewデータの読み込み
        let nib:UINib = UINib.init(nibName: CELL_XIB_FILENAME, bundle: nil);
        //読み込んだViewデータをバッファに登録
        self.tableView.registerNib(nib, forCellReuseIdentifier: CELL_ID);
        var tmp:[HobbyData] = [
            HobbyData(imgName: "imgbtn1.png", name: "ボタン押す", on: true),
            HobbyData(imgName: "email-ico.png", name: "メール出す", on: false),
            HobbyData(imgName: "xcode.png", name: "コード書く", on: true),
            HobbyData(imgName: "harinezumi.jpeg", name: "ハリネズミ", on: true)
        ];
        categoryList.append(HobbyCategory(name: "インドア", hobbyList: tmp));
        
        tmp = [
            HobbyData(imgName: "4.png", name: "外でボタン押す", on: true),
            HobbyData(imgName: "email-ico.png", name: "メール出す１", on: false),
            HobbyData(imgName: "email-ico.png", name: "メール出す２", on: false),
            HobbyData(imgName: "1.png", name: "外でコード書く", on: false),
            HobbyData(imgName: "2.png", name: "外でハリネズミ", on: true)
        ];
        categoryList.append(HobbyCategory(name: "アウトドア", hobbyList: tmp));

        //hobbyList.append(HobbyData(imgName: "imgbtn1.png", name: "ボタン押す", on: true));
        //hobbyList.append(HobbyData(imgName: "email-ico.png", name: "メール出す", on: false));
        //hobbyList.append(HobbyData(imgName: "xcode.png", name: "コード書く", on: true));
        //hobbyList.append(HobbyData(imgName: "harinezumi.jpeg", name: "ハリネズミ", on: true));
        
    }
    
    //---UITableViewDataSourceで指定されたメソッドのオーバーライド---
    //TableViewに入れるセクション数を決めるメソッド
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryList.count;
    }
    
    //各セクションのヘッダーに表示するテキストの指定
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryList[section].name;
    }
    
    //各セクションのフッターに表示するテキストの指定
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(categoryList[section].hobbyList.count)項目";
    }
    //TableViewに入ったセクションに入れる項目数を決めるメソッド
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList[section].hobbyList.count;
    }

    //TableViewに入った各項目に使用するCellデータを決めるメソッド
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        //バッファから指定したViewデータを取り出す
        //as クラス名 でサブクラスへキャスト出来る
        let cell:HobbyTableCell = tableView.dequeueReusableCellWithIdentifier(CELL_ID) as! HobbyTableCell;

        cell.imgIcon.image = UIImage(named:categoryList[indexPath.section].hobbyList[indexPath.row].imgName);
        cell.lblHobbyName.text = categoryList[indexPath.section].hobbyList[indexPath.row].name;
        cell.swHobbyYes.on = categoryList[indexPath.section].hobbyList[indexPath.row].on;
        //奇数行目か調べる
        if(indexPath.row % 2 == 1) {
            cell.view.backgroundColor = UIColor.whiteColor();
        }
        return cell;
    }
    
    //---UITableViewDelegateで指定されたメソッドのオーバーライド---
    //TableViewに入ったセルを選択した際に呼び出されるメソッド
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        //TableViewに登録されているcellを取り出す（引数に何行目のcellか指定している）
        let cell:HobbyTableCell = tableView!.cellForRowAtIndexPath(indexPath) as! HobbyTableCell ;
        //選択時に項目の選択on/offを切り替えている
        categoryList[indexPath.section].hobbyList[indexPath.row].on = !categoryList[indexPath.section].hobbyList[indexPath.row].on;
        cell.swHobbyYes.on = categoryList[indexPath.section].hobbyList[indexPath.row].on;
    }
 
}
