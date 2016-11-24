//
//  ScrollTestViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2016/10/06.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import UIKit

class ScrollTestViewController: UIViewController {
    
    @IBOutlet weak var scrollView :UIScrollView!
    
    // Screenの高さ
    var screenHeight:CGFloat!;
    // Screenの幅
    var screenWidth:CGFloat!;
    
    // Totalのページ数
    let pageNum:Int  = 4;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //画面の幅／高さを取り出すために
        //画面上の描画領域の四角形の大きさが設定されている部品を取り出す
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        //四角形の情報から幅を取り出す
        screenWidth = screenSize.width
        //ScrollViewの中に表示させる画像を用意
        let imageTop:UIImage = UIImage(named:"1")!
        //画像の幅／高さを取得
        let imageWidth = imageTop.size.width
        let imageHeight = imageTop.size.height
        
        //画像の幅画面いっぱいに画像を表示させたいので高さを計算で決める
        screenHeight = screenWidth * imageHeight/imageWidth
        
        print("pWidth: \(screenWidth)")
        
        //４つ全ての画像をScrollViewに設定していく
        for i in 0 ..< pageNum {
            let n:Int = i+1
            
            // UIImageViewのインスタンス
            let image:UIImage = UIImage(named:"\(n)")!
            let imageView:UIImageView = UIImageView(image:image)
            //ImageViewの大きさを計算した画面の幅／高さに設定する
            var rect:CGRect = imageView.frame
            rect.size.height = screenHeight
            rect.size.width = screenWidth
            imageView.frame = rect
            imageView.tag = n
            
            // UIScrollViewのインスタンスに画像を貼付ける
            self.scrollView.addSubview(imageView)
            
        }
        //ScrollView内に配置した画像の位置を横並びにする為の処理
        //自作関数
        setupScrollImages()
        
    }
    //ScrollView内に配置した画像の位置を横並びにする為の処理
    //自作関数
    func setupScrollImages(){
        
        // ダミー画像
        let imageDummy:UIImage = UIImage(named:"1")!
        var imgView = UIImageView(image:imageDummy)
        //ScrollViewに設定されているView（ImageViewなど）を
        //配列として全て取得
        var subviews:Array = scrollView.subviews
        
        // 描画開始の x,y 位置
        var px:CGFloat = 0.0
        //上から少し下に描画させる
        let py:CGFloat = 100.0
        //ScrollViewの中のImageView一つ一つの位置を調整していく
        for i in 0 ..< subviews.count {
            //配列の中身をImageViewとして取り出す
            imgView = subviews[i] as! UIImageView
            //ImageViewのクラスが正しくUIImageViewであった場合
            //かつ、tagに番号が振られている場合
            if (imgView.isKindOfClass(UIImageView.self) && imgView.tag > 0){
                //対象ImageViewの描画領域の四角形を決めている部品を再度取り出す
                var viewFrame:CGRect = imgView.frame
                //描画開始位置のずらし量を設定する
                viewFrame.origin = CGPoint(x: px, y: py)
                //ずらし量を変えた描画領域の四角形を再設定する
                imgView.frame = viewFrame
                //次の部品のずらし量は横幅を１画面分追加でずらす
                px += (screenWidth)
                
            }
        }
        // UIScrollViewのコンテンツサイズを画像を全て並べた後のサイズに合わせる
        let nWidth:CGFloat = screenWidth * CGFloat(pageNum)
        scrollView.contentSize = CGSize(width: nWidth, height: screenHeight)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}