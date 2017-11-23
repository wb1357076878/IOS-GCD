# IOS-GCD
iOS多线程--GCD

  GCD的使用步骤其实很简单，只有两步。

  创建一个队列（串行队列或并行队列）
  将任务添加到队列中，然后系统就会根据任务类型执行任务（同步执行或异步执行）
  下边来看看队列的创建方法和任务的创建方法。
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
