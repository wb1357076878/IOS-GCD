//
//  ViewController.m
//  GCD
//
//  Created by WangBo on 2017/11/23.
//  Copyright © 2017年 WangBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 队列的创建 DISPATCH_QUEUE_SERIAL: 串行队列 DISPATCH_QUEUE_CONCURRENT: 并行队列
    dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_CONCURRENT);
    
    // 2. 任务的创建
    dispatch_sync(queue1, ^{ // 同步执行任务，不会创建新的线程
        NSLog(@"%@",[NSThread currentThread]);
    });
    dispatch_async(queue2, ^{ // 异步执行任务，会创建新的线程
        NSLog(@"%@",[NSThread currentThread]);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
