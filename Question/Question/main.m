//
//  main.m
//  Question
//
//  Created by 常彪 on 15/12/3.
//  Copyright © 2015年 0xcb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if 0
        //5 1 1 3 4 2 5 3 2 4
        //4 1 3 1 2 4 3 2
        //3 1 2 1 3 2
        void (^PrintLn)(int) = ^(int n) {
            NSMutableArray *numArr = [NSMutableArray arrayWithCapacity:n*2];
            for (int i=0; i<n; ++i) {
                [numArr addObject:@(i+1)];
                [numArr addObject:@(i+1)];
            }
            [numArr sortUsingComparator:^NSComparisonResult(NSNumber *n1, NSNumber *n2) {
                return NSOrderedSame;
            }];
            NSLog(@"数列为 ===== %@", numArr);
        };
        PrintLn(3);
#endif
        
#if 0
        /*九九乘法表中结果不同的个数*/
        NSMutableSet *retSet = [NSMutableSet set];
        for (int i=1; i<10; ++i) {
            for (int j=1; j<10; ++j) {
                [retSet addObject:@(i*j)];
            }
        }
        NSLog(@"不同的结果个数 ===== %ld", retSet.count);
#endif
        
        
#if 0
        //字符个数来排序输出字符，结果 c  bbb  ……
        NSString *str = @"aaa bbb ccc bbb b c d aa bb c bbb c c c c c";
        NSLog(@"原始字符串 ==== %@", str);
        str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSInteger strLen = [str length];
        NSMutableArray *charArr = [NSMutableArray arrayWithCapacity:strLen];
        for (int i=0; i<strLen; ++i) {
            [charArr addObject:@([str characterAtIndex:i])];
        }
        [charArr sortUsingSelector:@selector(compare:)];
        NSMutableString *sortedStr = [NSMutableString stringWithCapacity:strLen];
        unichar lastChar = 0;
        for (int i=0; i<charArr.count; ++i) {
            unichar c = [charArr[i] charValue];
            if (c != lastChar) {
                [sortedStr appendString:@" "];
                lastChar = c;
            }
            [sortedStr appendFormat:@"%c", c];
        }
        NSLog(@"字符串按字符排序结果 ==== %@", sortedStr);
        NSArray *sortArr = [sortedStr componentsSeparatedByString:@" "];
        sortArr = [sortArr sortedArrayUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
            if (obj1.length > obj2.length) {
                return NSOrderedDescending;
            }else if (obj1.length == obj2.length) {
                return NSOrderedSame;
            }else {
                return NSOrderedAscending;
            }
        }];
        NSString *retStr = [sortArr componentsJoinedByString:@" "];
        NSLog(@"结果 ==== %@", retStr);
#endif
        
        
        //字符个数来排序输出字符，结果 c  bbb  ……
        NSString *str = @"aaa bbb ccc bbb b c d aa bb c bbb c c c c c";
        NSLog(@"原始字符串 ==== %@", str);
        NSArray *strComponts = [str componentsSeparatedByString:@" "];
        NSMutableDictionary *compontsDict = [NSMutableDictionary dictionary];
        for (NSString *s in strComponts) {
            NSInteger count = [[compontsDict valueForKey:s] integerValue];
            [compontsDict setValue:@(++count) forKey:s];
        }
        NSArray *allKeys = compontsDict.allKeys;
        allKeys = [allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            return [compontsDict[obj2] compare:compontsDict[obj1]];
        }];
        NSString *retStr = [allKeys componentsJoinedByString:@" "];
        NSLog(@"结果 ==== %@", retStr);
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
