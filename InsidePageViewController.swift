//
//  InsidePageViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2016/12/01.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import UIKit

class InsidePageViewController : UIPageViewController , UIPageViewControllerDataSource {
    
    var nowPage:Int = 0;
    
    //使用するViewControllerのリスト（廃止）
    //var viewControllerList:[UIViewController]!
    
    //各ページのViewContorollerの名前リスト
    var viewControllerNameList:[String]!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //登録したいViewControllerを取得する（廃止）
        /*viewControllerList = [
         storyboard!.instantiateViewControllerWithIdentifier("APageViewController"),
         storyboard!.instantiateViewControllerWithIdentifier("BPageViewController"),
         storyboard!.instantiateViewControllerWithIdentifier("CPageViewController")
         ];*/
        
        //各ページのViewContorollerの名前を配列で管理
        viewControllerNameList = [
            "OneViewController",
            "TwoViewController"
        ];
        
        //始めに表示をするViewControllerを指定
        self.setViewControllers([storyboard!.instantiateViewControllerWithIdentifier(viewControllerNameList[nowPage])], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil);
        
        //PageViewで表示するViewController(データ)を持っているのは自分自身
        self.dataSource = self;
        
    }
    
    
    //前のページへ移動した時、表示するViewControllerを指定する(右スワイプ時)
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        //ページを一つ前にずらす
        nowPage -= 1;
        //ループする場合
        /*
         if(nowPage < 0){
         //最後のページへループ
         nowPage = viewControllerNameList - 1;
         }
         */
        //ループしない場合
        if(nowPage < 0){
            nowPage = 0;
            //移動する先がない場合はnil
            return nil;
        }
        
        return storyboard!.instantiateViewControllerWithIdentifier(viewControllerNameList[nowPage]);
        
    }
    //次のページへ移動した時、表示するViewControllerを指定する(左スワイプ時)
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        //ページを一つ次にずらす
        nowPage += 1;
        //ループする場合
        /*
         if(nowPage > viewControllerList.count - 1) {
         //最初のページへループ
         nowPage = 0;
         }
         */
        //ループしない場合
        if(nowPage > viewControllerNameList.count - 1) {
            nowPage = viewControllerNameList.count - 1;
            //移動する先がない場合はnil
            return nil;
        }
        return storyboard!.instantiateViewControllerWithIdentifier(viewControllerNameList[nowPage]);
    }
}
