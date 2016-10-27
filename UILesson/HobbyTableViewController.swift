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
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //TableViewに対する設定
        //TableViewに入れるセルの高さの設定(全てのセルの高さが同じ場合に使用)
        tableView.rowHeight = 92;
        //TableViewに入れるセルのセクション数／項目数を決める処理を書くクラスの指定
        tableView.dataSource = self
        //TableViewに入れられたセルに対してタップなどで操作した時の処理を書くクラスの指定
        tableView.delegate = self
        
        //xibファイルからViewデータの読み込み
        let nib:UINib = UINib.init(nibName: CELL_XIB_FILENAME, bundle: nil);
        //読み込んだViewデータをバッファに登録
        self.tableView.registerNib(nib, forCellReuseIdentifier: CELL_ID);
    }
    
    //---UITableViewDataSourceで指定されたメソッドのオーバーライド---
    //TableViewに入れるセクション数を決めるメソッド
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //TableViewに入ったセクションに入れる項目数を決めるメソッド
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }

    //TableViewに入った各項目に使用するCellデータを決めるメソッド
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->  UITableViewCell {
        //バッファから指定したViewデータを取り出す
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CELL_ID)!;
        return cell;
    }
    
    //---UITableViewDelegateで指定されたメソッドのオーバーライド---
    //TableViewに入ったセルを選択した際に呼び出されるメソッド
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
    }
 
}
