//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  LXCastleGameFish.m
//  LXCastleGameFish
//
//  Created by Lyon Xu on 2018/9/22.
//  Copyright (c) 2018年 Lyon Xu. All rights reserved.
//

#import "LXCastleGameFish.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>

CHDeclareClass(CustomViewController)

CHOptimizedMethod(0, self, NSString*, CustomViewController,getMyName){
    return @"MonkeyDevPod";
}

CHConstructor{
    CHLoadLateClass(CustomViewController);
    CHClassHook(0, CustomViewController, getMyName);
}
