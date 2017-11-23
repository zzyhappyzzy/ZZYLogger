//
//  ZZYLog.h
//  ZZYLogUtilDemo
//
//  Created by zhenzhaoyang on 2017/11/21.
//  Copyright © 2017年 zhenchy. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 日志写入磁盘
 同一天的日志，写在一份日志文件里
 */
#define ZFile(...)        logToFile(__FUNCTION__,__LINE__,__VA_ARGS__)

#if DEBUG
    #define ZDebug(...)   logDebug(__FUNCTION__,__LINE__,__VA_ARGS__)
    #define ZInfo(...)    logInfo(__FUNCTION__,__LINE__,__VA_ARGS__)
    #define ZWarning(...) logWarning(__FUNCTION__,__LINE__,__VA_ARGS__)
    #define ZError(...)   logError(__FUNCTION__,__LINE__,__VA_ARGS__)
#else
    #define ZDebug(...)
    #define ZInfo(...)
    #define ZWarning(...)
    #define ZError(...)
#endif

@interface ZZYLog : NSObject

void logDebug(const char *funcName, int line, NSString *format,...);
void logInfo(const char *funcName, int line, NSString *format,...);
void logWarning(const char *funcName, int line, NSString *format,...);
void logError(const char *funcName, int line, NSString *format,...);
void logToFile(const char *funcName, int line, NSString *format,...);

@end
