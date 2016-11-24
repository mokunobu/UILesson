//
//  PageViewController.swift
//  UILesson
//
//  Created by iMac200901 on 2016/11/24.
//  Copyright © 2016年 okunobu.ncp.jp. All rights reserved.
//

import UIKit

class PageViewController : UIPageViewController, UIPageViewControllerDataSource {

    var nowPage:Int = 0;
    
    //使用するViewControllerのリスト
    var viewControllerList:[UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //登録したいViewControllerを取得する
        viewControllerList = [
            storyboard!.instantiateViewControllerWithIdentifier("APageViewController"),
            storyboard!.instantiateViewControllerWithIdentifier("BPageViewController"),
            storyboard!.instantiateViewControllerWithIdentifier("CPageViewController")
        ];
        
        //始めに表示をするViewControllerを指定
        self.setViewControllers([viewControllerList[nowPage]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil);
        
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
            nowPage = viewControllerList.count - 1;
        }
        */
        //ループしない場合
        if(nowPage < 0){
            nowPage = 0;
            //移動する先がない場合はnil
            return nil;
        }
        
        return viewControllerList[nowPage];
    
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
        if(nowPage > viewControllerList.count - 1) {
            nowPage = viewControllerList.count - 1;
            //移動する先がない場合はnil
            return nil;
        }
        return viewControllerList[nowPage];
    }
    
}
