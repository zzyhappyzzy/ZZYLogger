# ZZYLogger
Simple replacement for NSLog

# Why
According to Apple's documentation [NSLog](https://developer.apple.com/documentation/foundation/1395275-nslog).
>Logs an error message to the Apple System Log facility

* `NSLog` is really very simple and helpful when debugging programs.
* It is better to remove `NSLog` in release production.
* Since Xcode8, it is hard to console logs with colorful theme.
* Sometimes we need save log to files.

# Usage
Just drag `ZZYLog.h` and `ZZYLog.m` file to your project and then `import "ZZYLog.h"`

```objc
ZError(@"Simple Error");
ZWarning(@"Simple Warning");
ZInfo(@"Just simple info");
ZDebug(@"Everything is OK");
ZFile(@"Simple message write to file");
```
# Output
* Error   -----  ❌
* Warning -----  🍋
* Info    -----  🍏
* Debug   -----  🍎
* File    -----  write to disk
