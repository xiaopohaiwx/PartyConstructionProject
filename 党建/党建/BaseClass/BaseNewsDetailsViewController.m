//
//  BaseNewsDetailsViewController.m
//  党建
//
//  Created by 邱敏 on 2018/10/26.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "BaseNewsDetailsViewController.h"
#import <WebKit/WebKit.h>
#import "NewsDetailsViewModel.h"

@interface BaseNewsDetailsViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation BaseNewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _topString;
    
    __weak typeof(self) weakSelf = self;
    //从网络获取内容信息
    [NewsDetailsViewModel getNewsDetails:^(NSString * _Nonnull str) {
        weakSelf.contentStr = str;
        [weakSelf getWkWebView];
    } NewsID:self.newsID ViewController:self];
    
}

//WkWebView
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
                                   <style>\
                                   img {\
                                   display:table-cell;\
                                   text-align:center;\
                                   vertical-align:middle;\
                                   max-width:%fpx;\
                                   width:expression(this.width<%fpx?\"auto\":\"%fpx\");\
                                   max-height:auto;\
                                   margin:auto;\
                                   }</style>\
                                   <body width=\"%fpx\" style=\"\"><h3>%@</h3><div class=\"header\" style=\"word-break : break-all;overflow:hidden;width: %fpx;font-size:%fpx\">%@</div></body></html>", width, width, width, width, self.titleString, width, fontSize, self.contentStr];
    
    [contentStr replaceOccurrencesOfString:@"<img" withString:@"<img onclick =\"imgClicked(this)\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [contentStr length] - 1)];
    
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

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSString *str = [navigationAction.request.mainDocumentURL pathExtension];
    if ([str isEqualToString:@"png"]||[str isEqualToString:@"jpg"] || [str isEqualToString:@"gif"])
    {
        NSLog(@"%@", [[navigationAction.request URL] absoluteString]);
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}


//获取数据
-(void)getNewsData:(TableCellModel *)obj
{
    _newsID = [NSString stringWithFormat:@"%@", obj.newsId];
    _titleString = obj.title;
}

@end
