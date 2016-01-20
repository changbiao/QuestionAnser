//
//  ViewController.m
//  Question
//
//  Created by 常彪 on 15/12/3.
//  Copyright © 2015年 0xcb. All rights reserved.
//

#import "ViewController.h"
//#import <SafariServices/SafariServices.h>
#import "People.h"
#import <MessageUI/MessageUI.h>
#import "Masonry.h"



@interface Father : NSObject
@end
@implementation Father
@end

@interface Son : Father
@end
@implementation Son
- (id)init
{
    self = [super init];
    if (self) {
        NSLog(@"SSSS self %@", NSStringFromClass(self.class));
        NSLog(@"SSSS super %@", NSStringFromClass(super.class));
    }
    return self;
}

@end


@interface CCView : UIView
@end

@implementation CCView
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    [self.layer drawInContext:ctx];
}
@end


@interface ViewController ()
{
    SFSafariViewController *_safari;
}
@property (weak, nonatomic) IBOutlet UIView *animationView;
@end


int rand100(){return rand()%100;}

int rand100();
int rand10000()
{
    int r = 0;
    for (int i=0; i<100; ++i) {
        r += rand100();
    }
    return r;
}
int rand10000_()
{
    return rand100() * 100 + rand100();
}

const int N = 10;

BOOL haveSame(NSMutableArray *numArr)
{
    for (int i=0; i<numArr.count; ++i) {
        for (int j=i+1; numArr.count>=i+1 && j<numArr.count; ++j) {
            if ([numArr[i] isEqual:numArr[j]]) {
                [numArr removeObjectAtIndex:i];
                [numArr removeObjectAtIndex:j];
                return YES;
            }
        }
    }
    return NO;
}

int getMax(int arrLength[N])
{
    NSMutableArray *numbs = [NSMutableArray arrayWithCapacity:N];
    for (int i=0; i<N; ++i) {
        [numbs addObject:@(arrLength[i])];
    }
    int max = 0;
    while (haveSame(numbs)) {
        max++;
    }
    return max;
}


int getTotal(int arrOrigin[N])
{
    int ret=0;
    for (int i=0;i<N;i++)
        for (int j=i+1;j<N;j++)
            if (arrOrigin[i]!=arrOrigin[j]) ret++;
    return ret;
}

const int M_1 = 3;
const int N_1 = 4;
int printMatrix(int arrMartrix[M_1][N_1])
{
    for (int i=0; i<N_1; ++i) {
//        int c
        for (int j=0; j<=i; ++j) {
            printf(" %d ->", arrMartrix[j][i]);
        }
    }
    printf("\n");
    return 0;
}

void test_ref_ptr(int a, int *b)
{
    int x = a;
    int *xPtr = &x;
    int **xPtrPtr = &xPtr;
    int ***xPtrPtrPtr = &xPtrPtr;
    int ****xPtrPtrPtrPtr = &xPtrPtrPtr;
    int *****xPtrPtrPtrPtrPtr = &xPtrPtrPtrPtr;
    NSLog(@"x=a ===== %c", *****xPtrPtrPtrPtrPtr);
    *****(&xPtrPtrPtrPtr) = 'C';
    NSLog(@"x=a ===== %c", *****xPtrPtrPtrPtrPtr);
    
    int *bPtr = b;
    int **bPtrPtr = &bPtr;
    int ***bPtrPtrPtr = &bPtrPtr;
    int ****bPtrPtrPtrPtr = &bPtrPtrPtr;
    int *****bPtrPtrPtrPtrPtr = &bPtrPtrPtrPtr;
    NSLog(@"*b ===== %c", *****bPtrPtrPtrPtrPtr);
    *b = 'D';
    NSLog(@"*b ===== %c", *****bPtrPtrPtrPtrPtr);
}



@implementation ViewController

/**
 *  获取沙盒里面一个文件的路径
 *
 *  @param fileName 文件名
 *
 *  @return 文件路径
 */
- (NSString *)getSandboxFilePathWithFile:(NSString *)fileName
{
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UISearchBar
    
    //3.x之后没有了
    //AFHTTPRequestOperationManager
    
    //iOS7.0之后才有的
    NSURLSessionDataTask *dataTask = [[AFHTTPSessionManager manager] GET:@"https://www.baidu.com" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功 === %@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求失败 === %@", error);
    }];
    
    
    
    [UIColor colorWithRed:0.110 green:0.000 blue:0.812 alpha:1.000];
    
    float a = 1028765.4321909;
    NSMutableString *fmtAStr = [NSMutableString stringWithFormat:@"￥%.3f", a];
    NSLog(@"格式化 == %@", fmtAStr);
    int dotIdx = (int)(fmtAStr.length-1);
    for (int i=dotIdx; i>0; --i) {
        if ([fmtAStr characterAtIndex:i] == '.') {
            dotIdx = i;
        }
        if (dotIdx-i == 3 && i>1) {
            [fmtAStr insertString:@"," atIndex:i];
            dotIdx = i;
        }
    }
    NSLog(@"格式化 === %@", fmtAStr);
    
    
    int numbs[N] = {1, 2, 3, 4, 2, 3, 2, 2, 3, 9};
    int maxCnt = getMax(numbs);
    NSLog(@"成对相同的数字对数 ==== %d", maxCnt);
    
    int numbMatrix[M_1][N_1] = {
        {0, 1, 2, 3},
        {4, 5, 6, 7},
        {8, 9, 10, 11}
    };
    printMatrix(numbMatrix);
    
    
    NSString *ascStr = @"abc_def-xez.ez343*3@#%xyz";
    NSMutableArray *allChars = [NSMutableArray arrayWithCapacity:ascStr.length];
    for (int i=0; i<ascStr.length; ++i) {
        [allChars addObject:[NSString stringWithFormat:@"%c", [ascStr characterAtIndex:i]]];
    }
    NSArray *reverseChars = [[allChars reverseObjectEnumerator] allObjects];
    NSString *descStr = [reverseChars componentsJoinedByString:@" "];
    NSLog(@"字符串逆序插入空格 ==== %@", descStr);
    
    
    CGSize scrSize = [UIScreen mainScreen].bounds.size;
    CGPoint srcPos = CGPointMake(20, scrSize.height*0.5f);
    CGPoint destPos = CGPointMake(scrSize.width-40, scrSize.height*0.8f);
    CGPoint ctrlPos = CGPointMake(scrSize.width*0.6f, scrSize.height*0.3f);
    
    UIBezierPath *bPath = [UIBezierPath bezierPath];
    [bPath moveToPoint:srcPos];
    [bPath addQuadCurveToPoint:destPos controlPoint:ctrlPos];
    
    CAKeyframeAnimation* animation;
    animation = [CAKeyframeAnimation animation];
    animation.path = bPath.CGPath;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 3;
    animation.repeatCount = 1;
    
    CAShapeLayer *debugLayer = [CAShapeLayer layer];
    debugLayer.fillColor = nil;
    debugLayer.strokeColor = [UIColor blueColor].CGColor;
    debugLayer.frame = self.view.bounds;
    debugLayer.path = bPath.CGPath;
    [self.view.layer addSublayer:debugLayer];
    
    CABasicAnimation* animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.duration = 3;
    animation2.repeatCount = 1;
    animation2.fromValue = @(1);
    animation2.toValue = @(0.3f);
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    [self.animationView.layer addAnimation:animation forKey:@"position"];
    [self.animationView.layer addAnimation:animation2 forKey:@"opacity"];
    self.animationView.layer.cornerRadius = 10;
    
    
    NSString *sStr = @"03ou4 上 213fawer 下 wess-sz,sd0=3g234";
    NSMutableCharacterSet *charSet = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [charSet formUnionWithCharacterSet:[NSCharacterSet controlCharacterSet]];
    [charSet formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    [charSet formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    [charSet formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];
    [charSet formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];
    [charSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    sStr = [[sStr componentsSeparatedByCharactersInSet:charSet] componentsJoinedByString:@""];
    NSLog(@"中文 === %@", sStr);

//    UIGestureRecognizer
    
    
    NSLog(@"1~~~~~~");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2~~~~~");
//    });
    NSLog(@"3~~~~~~~");
    
    
    //默认构造方法
    People *p = [[People alloc] init];
    //指定名字
    People *p2 = [[People alloc] initWithName:@"张三"];
    p = p2;
    
    
//    __weak ViewController *weakSelf = self;
    void (^printPeople)() = ^() {
        ViewController *strongSelf = self;
        //...
        
        strongSelf = nil;
    };
    printPeople();
    
    
    //屏幕亮度
    [UIScreen mainScreen].brightness = 1.0f;
    
    
    Son *s = [[Son alloc] init];
    s = s;
    
    //C方法
//    exit(0);
//    malloc(sizeof(int));
    
    
//    NSOperationQueue
//    UITableView
//    Message
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TD内部上线公告-1" ofType:@"docx"];
    
    NSString *InboxDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Inbox"];
    NSString *path2 = [InboxDir stringByAppendingPathComponent:@"TD内部上线公告-1.docx"];
    NSURL *url2 = [NSURL fileURLWithPath:path2];
    NSLog(@"path1 ==== %@", path);
    NSLog(@"path2 ==== %@", url2);
    
    
    char str_arr[100];
    char *str_ptr = malloc(sizeof(char)*100);
    NSLog(@"sizeof str_arr=%lu str_ptr=%lu", sizeof(str_arr), sizeof(str_ptr));
    
    
    NSLog(@"%0.0f", 5.0);
    
    //使用递归进行深层遍历
    [self listItemsAtPath:NSHomeDirectory()];
    
    __weak __block void (^testBlockWeak)(int) = nil;
    //__weak ViewController *weakSelf = self;
    __block void (^testBlock)(int) = ^(int a){
        printf("%d ", a);
        if (a < 100) {
            testBlockWeak(++a);
            //weakSelf.view.backgroundColor = [UIColor redColor];
        }
    };
    testBlockWeak = testBlock;
    testBlock(1);
    
    
    _safari = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    _safari.view.backgroundColor = [UIColor redColor];
//    [self presentViewController:_safari animated:YES completion:nil];
    
    //Masonry demo
    UIView *topBar = [[UIView alloc] init];
    topBar.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topBar];
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(20);
        make.left.equalTo(self.view.mas_left).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(-20);
        make.height.equalTo(@44);
    }];
    
    //比如这是把服务端转成中文,反过来这么搞:
    NSString *(^ChangeToChinessEncode)(NSString *) = ^(NSString *fileTitleStr) {
        if (fileTitleStr != NULL)
        {
            char *ReadStoreValue = (char *)[fileTitleStr cStringUsingEncoding:[NSString defaultCStringEncoding]];
            if ( ReadStoreValue != NULL )
            {
                fileTitleStr = [NSString stringWithCString:ReadStoreValue encoding:-2147482062];
            }
        }
        return fileTitleStr;
    };
    
    NSString *chStr = ChangeToChinessEncode(@"aaaa");
    NSLog(@"======== %@", chStr);
    
    //iPad弹出视图控制器
//    UIPopoverController
    
    //MasterDetail App
//    UISplitViewController
    
    //二分法查找有序数据
    NSArray *array = @[@1, @2, @3];
    //[array indexOfObject:]
    //[array indexOfObject:(nonnull id) inSortedRange:(NSRange) options:(NSBinarySearchingOptions) usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
    
    //}]
    
    //时间差
    //CACurrentMediaTime()
    //CFAbsoluteTimeGetCurrent()
    
    //外接键盘快捷键
    //UIKeyCommand
    [self addKeyCommand:[UIKeyCommand keyCommandWithInput:@"1" modifierFlags:UIKeyModifierCommand action:@selector(keyCommandFirstAction)]];

    char typeCode[] = @encode(typeof(self));
    //[[[NSCoder alloc] init] encodeValueOfObjCType:typeCode at:nil];
    
    struct {
        //@defs(NSObject);
    };
    
    @autoreleasepool {
        
    }
    
    @synchronized(self) {
        
    }
    
    //锁 NSLock
    //OSAtomicCompareAndSwap32(3)
    //OSAtomicCompareAndSwap32Barrier
    
    // 允许代码使用 UICollectionView 如同它可以在iOS SDK 5使用一样。
    // http://developer.apple.com/legacy/mac/library/#documentation/DeveloperTools/gcc-3.3/gcc/compatibility_005falias.html
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 60000
    @compatibility_alias UICollectionViewController PSTCollectionViewController;
    @compatibility_alias UICollectionView PSTCollectionView;
    @compatibility_alias UICollectionReusableView PSTCollectionReusableView;
    @compatibility_alias UICollectionViewCell PSTCollectionViewCell;
    @compatibility_alias UICollectionViewLayout PSTCollectionViewLayout;
    @compatibility_alias UICollectionViewFlowLayout PSTCollectionViewFlowLayout;
    @compatibility_alias UICollectionViewLayoutAttributes     PSTCollectionViewLayoutAttributes;
    @protocol UICollectionViewDataSource <PSTCollectionViewDataSource> @end
    @protocol UICollectionViewDelegate <PSTCollectionViewDelegate> @end
#endif
 
    
    @try {
        //Code that can potentially throw an exception
    }
    @catch (NSException *exception) {
        //Handle an exception thrown in the @try block
    }
    @finally {
        //Code that gets executed whether or not an exception is thrown
    }
    
    //@throw [NSException exceptionWithName:@"异常" reason:@"失败了" userInfo:nil];
    
    //C++中引入C的函数
    __BEGIN_DECLS
    
    __END_DECLS
    
    
//    UITableView
    
    //函数指针
    void (*myfunc)();
    myfunc = 0;
    //myfunc();

    //上面三句的缩写
    //((void(*)())0)();
    
    int numA = 55;
    int numB = 22;
    numA = numA - numB;
    numB = numB + numA;
    numA = numB - numA;
    NSLog(@"numA:%ld numB:%ld", numA, numB);

    void (^swap)(int*, int*) = ^(int *nPtrA, int *nPtrB){
        int tmp = *nPtrA;
        *nPtrA = *nPtrB;
        *nPtrB = tmp;
    };
    swap(&numA, &numB);
    NSLog(@"numA:%ld numB:%ld", numA, numB);

    

    //直接把原来的transform覆盖为旋转45度
    self.view.transform = CGAffineTransformMakeRotation(M_PI_4);
    //在原来的transform基础上旋转45度
    self.view.transform = CGAffineTransformRotate(self.view.transform, M_PI_4);
    //在原来的transform基础上旋转45度
    self.view.transform = CGAffineTransformConcat(self.view.transform, CGAffineTransformMakeRotation(M_PI_4));
    
    int numRef = 'A';
    int numPtr = 'B';
    test_ref_ptr(numRef, &numPtr);
    NSLog(@"test_ref_ptr ==== %c %c", numRef, numPtr);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)keyCommandFirstAction
{
    NSLog(@"CMD + 1 按下了");
}

- (void)listItemsAtPath:(NSString *)path
{
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL isDir = NO;
    if ([fm fileExistsAtPath:path isDirectory:&isDir] && isDir) {
        NSArray *items = [fm contentsOfDirectoryAtPath:path error:nil];
        for (NSString *p in items) {
            NSString *fullPath = [path stringByAppendingPathComponent:p];
            [self listItemsAtPath:fullPath];
        }
    }else{
        NSLog(@"文件  ==== %@", path);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
