//
//  ZZYLog.m
//  ZZYLogUtilDemo
//
//  Created by zhenzhaoyang on 2017/11/21.
//  Copyright © 2017年 zhenchy. All rights reserved.
//

#import "ZZYLog.h"
#import <asl.h>
#import <os/log.h>

static os_log_t zzy_log;
static NSDateFormatter *dateFormat;

@interface ZZYLog()

@end

@implementation ZZYLog


os_log_t zzyLogConfig() {
    if (!zzy_log) {
        if (@available(iOS 10.0, *)) {
            zzy_log = os_log_create("com.zhenchy", processorName());
        } else {
            // Fallback on earlier versions
        }
    }
    return zzy_log;
}

const char *processorName() {
    NSString *appName = [[NSProcessInfo processInfo] processName];
    if (!appName) {
        appName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    }
    if (!appName) {
        appName = @"ZLog";
    }
    return [appName UTF8String];
}

void logDebug(const char *funcName, int line, NSString *format,...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    message = [NSString stringWithFormat:@"Debug🍎 (%s line:%d) %@",funcName,line,message];
    
    if (@available(iOS 10.0, *)) {
        os_log_debug(zzyLogConfig(), "%@",message);
    } else {
        asl_log(NULL, NULL, ASL_LEVEL_DEBUG, "%s",[message UTF8String]);
    }
}

void logInfo(const char *funcName, int line, NSString *format,...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    message = [NSString stringWithFormat:@"Info🍏 (%s line:%d) %@",funcName,line,message];
    
    if (@available(iOS 10.0, *)) {
        os_log_info(zzyLogConfig(), "%@",message);
    } else {
        asl_log(NULL, NULL, ASL_LEVEL_INFO, "%s",[message UTF8String]);
    }
}

void logWarning(const char *funcName, int line, NSString *format,...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    message = [NSString stringWithFormat:@"Warning🍋 (%s line:%d) %@",funcName,line,message];
    
    if (@available(iOS 10.0, *)) {
        os_log_error(zzyLogConfig(), "%@",message);
    } else {
        asl_log(NULL, NULL, ASL_LEVEL_WARNING, "%s",[message UTF8String]);
    }
}

void logError(const char *funcName, int line, NSString *format,...) {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    message = [NSString stringWithFormat:@"Error❌ (%s line:%d) %@",funcName,line,message];
    
    if (@available(iOS 10.0, *)) {
        os_log_error(zzyLogConfig(), "%@",message);
    } else {
        asl_log(NULL, NULL, ASL_LEVEL_ERR, "%s",[message UTF8String]);
    }
}

void logToFile(const char *funcName, int line, NSString *format,...) {
    FILE *logFile = fopen([logFilePath() UTF8String], "a+");
    if (!logFile) return;
    
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    
    fprintf(logFile, "%s ",getCurrentDateString(@"yyyy-MM-dd HH:mm:ss"));
    fprintf(logFile, "[%s-line:%d] - %s\n", funcName, line, [message UTF8String]);
    fflush(logFile);
}

NSString* logFilePath() {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *directory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    if (!directory) return nil;
    directory = [directory stringByAppendingPathComponent:@"Log"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *fileName = [NSString stringWithFormat:@"%s_log.txt",getCurrentDateString(@"yyyy-MM-dd")];
    NSString *fullPath = [directory stringByAppendingPathComponent:fileName];
    ZInfo(@"the log file path is %@",fullPath);
    return fullPath;
}

const char* getCurrentDateString(NSString *format) {
    if (!dateFormat) {
        dateFormat = [[NSDateFormatter alloc] init];
    }
    [dateFormat setDateFormat:format];
    NSString *dateStr = [dateFormat stringFromDate:[NSDate date]];
    return [dateStr UTF8String];
}

@end
