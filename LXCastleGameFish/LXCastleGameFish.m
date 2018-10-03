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

//Hook的class
CHDeclareClass(AFHTTPSessionManager);

// - (id)POST:(id)arg1 parameters:(id)arg2 progress:(id)arg3 success:(id)arg4 failure:(id)arg5
CHMethod(5, void, AFHTTPSessionManager, POST, id, arg1, parameters, id, arg2, progress, id, arg3, success, id, arg4, failure, id, arg5)
{
    NSLog(@"%s::%@\n %@", __func__, arg1, arg2);
    return CHSuper(5, AFHTTPSessionManager, POST, arg1, parameters,arg2, progress, arg3, success, arg4, failure, arg5);
}

__attribute__((constructor)) static void entry()
{
    CHLoadLateClass(AFHTTPSessionManager);
    CHClassHook(5, AFHTTPSessionManager, POST, parameters, progress, success, failure);
}
