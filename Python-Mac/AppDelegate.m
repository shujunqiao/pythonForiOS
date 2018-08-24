//
//  AppDelegate.m
//  Python-Mac
//
//  Created by qwe on 2018/8/24.
//  Copyright © 2018年 Fancyzero. All rights reserved.
//

#import "AppDelegate.h"
#include "Python.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    
    //init python
    //get python lib path and set this path as python home directory
    NSString* fullpath = [[NSBundle mainBundle] pathForResource:@"python" ofType:nil inDirectory:nil];
    char home[1024];
    strcpy(home, [fullpath UTF8String]);
    
    Py_SetPythonHome(home);
    Py_Initialize();
    //执行python语句
    PyRun_SimpleString("print 'hello'");//say hello see debug output :)
    
    dispatch_queue_t queue = dispatch_queue_create(0, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        //执行python脚本
        NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"server2"     ofType:@"py"];
        
        FILE *mainFile = fopen([scriptPath UTF8String], "r");
        
        PyRun_SimpleFile(mainFile, (char *)[[scriptPath lastPathComponent] UTF8String]) ;
        
    });
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
