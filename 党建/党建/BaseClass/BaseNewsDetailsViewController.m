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

@interface BaseNewsDetailsViewController ()<WKNavigationDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation BaseNewsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = _topString;
    
    __weak typeof(self) weakSelf = self;
    //从网络获取内容信息

    [NewsDetailsViewModel getNewsDetailsContent:^(NSString * _Nonnull content, NSString * _Nonnull title) {
        weakSelf.contentStr = content;
        weakSelf.titleString = title;
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
/**
 *  每当webView即将发送一个请求之前，都会调用这个方法
 *  返回Allow，允许加载这个请求， 返回Cancel，禁止加载这个请求
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSString *str = [navigationAction.request.mainDocumentURL pathExtension];
    if ([str isEqualToString:@"png"]||[str isEqualToString:@"jpg"] || [str isEqualToString:@"gif"])
    {
        NSLog(@"%@", [[navigationAction.request URL] absoluteString]);
        NSString *imgUrl = [[navigationAction.request URL] absoluteString];
        NSLog(@"%@", imgUrl);
        if(_scrollView)
        {
            _scrollView.hidden = NO;
            _imgView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
            _imgView.contentMode = UIViewContentModeScaleAspectFit;//图片自适应
            _imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[navigationAction.request URL]]];
        }
        else
        {
            [self showBigImage:imgUrl];
        }
        
        
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)showBigImage:(NSString *)imageUrl
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _scrollView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.9];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
    _imgView.userInteractionEnabled = YES;
    [_imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    [_scrollView addSubview:_imgView];
    
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2;
    _scrollView.delegate = self;
    _scrollView.contentSize = _imgView.frame.size;
    [_scrollView setZoomScale:1 animated:YES];
    
}

//设置缩放内容
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imgView;
}

//控制缩放是在中心
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0;
    self.imgView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX, scrollView.contentSize.height * 0.5 + offsetY);
}

//单击手势
- (void) tap:(UITapGestureRecognizer *)tap
{
    self.scrollView.hidden = YES;
    NSLog(@"-------");
}

//获取数据
-(void)getNewsData:(TableCellModel *)obj
{
    _newsID = [NSString stringWithFormat:@"%@", obj.newsId];
    _titleString = obj.title;
}

@end
