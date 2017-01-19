//
//  WebViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2017/01/12.
//  Copyright © 2017年 okunobu.ncp.jp. All rights reserved.
//

import UIKit

class WebViewController :  UIViewController, UIWebViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WebViewのイベントを対応するのはこのクラス自身
        webView.delegate = self;
        //初期画面の指定とアクセス開始
        //アクセスするページのURL
        let url:NSURL = NSURL(string : "https://google.com")!
        //let url = NSURL(string : "https://flets.com")
        //指定したURLにアクセス開始
        //リクエスト用の部品を作成
        let urlRequest:NSURLRequest = NSURLRequest(URL: url)
        //WebViewを使ってリクエスト開始
        webView.loadRequest(urlRequest)
        
        //SearchBarのイベントを対応するのはこのクラス自身
        searchBar.delegate = self;
    }
    
    //---UIWebViewDelegateの実装---//
    //アクセス時に実行される処理
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //リクエストを開始した時のリクエスト先のURLをsearchBarへ入れておく
        searchBar.text = request.URL?.absoluteString;
        return true;
    }
 
    //---UISearchBarDelegateの実装---//
    //SearchBarへ入力中のテキストを入れておく変数
    var inputURLStr : String = "";
    
    //サーチバー更新時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        //入力中のテキストが更新される度に変数の中を更新しておく
        inputURLStr = searchText;
    }
    
    //キャンセルクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
    
    //サーチボタンクリック時(UISearchBarDelegateを関連づけておく必要があります）
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        //初期画面の指定とアクセス開始
        //入力中のテキストを保管している変数の中身をアクセス先としてリクエスト開始
        let url = NSURL(string : inputURLStr)
        let urlRequest = NSURLRequest(URL: url!)
        webView.loadRequest(urlRequest)
    }
}
