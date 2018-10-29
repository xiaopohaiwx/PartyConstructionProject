//
//  HistoryOfTodayViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "HistoryOfTodayViewController.h"
#import "NewsDetailsViewModel.h"
#import <WebKit/WebKit.h>

@interface HistoryOfTodayViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) NSString *contentStr;

@end

@implementation HistoryOfTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    [NewsDetailsViewModel getContent:^(NSString * _Nonnull str) {
        weakSelf.contentStr = str;
        [weakSelf getWkWebView];
    } ViewController:self];
    
}

-(void)getWkWebView
{
    
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(8, 0, self.view.frame.size.width - 16, self.view.frame.size.height)];
    _wkWebView.navigationDelegate = self;
    _wkWebView.backgroundColor = [UIColor clearColor];
    _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
    _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_wkWebView];
    
    CGFloat width = [[UIScreen mainScreen] bounds].size.width - 30;
    CGFloat fontSize = 18;
    NSMutableString *contentStr = [NSMutableString stringWithFormat:@"<html>\
                                   <head>\
                                   <title></title>\
                                   <meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0, user-scalable=1\" />\
                                   </head>\
                                   <body width=\"%fpx\" style=\"\"><div class=\"header\" style=\"word-break : break-all;overflow:hidden;width: %fpx;font-size:%fpx\">%@</div></body></html>", width, width, fontSize, self.contentStr];
    
//    [contentStr replaceOccurrencesOfString:@"<img" withString:@"<img onclick =\"imgClicked(this)\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [contentStr length] - 1)];
    
    [_wkWebView loadHTMLString:contentStr baseURL:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [webView evaluateJavaScript:@"function imgClicked(element) {\
     document.location = element.src;\
     }" completionHandler:^(id par, NSError *error) {
         // Block中处理是否通过了或者执行JS错误的代码
         ;
     }];

    //    [webView stringByEvaluatingJavaScriptFromString: @"function imgClicked(element) {\
    //     document.location = element.src;\
    //     }"];
}

@end
