//
//  DetailViewController.m
//  IApp
//
//  Created by CodeAm on 2020/7/9.
//  Copyright © 2020年 codeam. All rights reserved.
//

#import "DetailViewController.h"
#import "../Model/LIstLoad.h"

@interface DetailViewController ()<WKNavigationDelegate>
@property(nonatomic, strong, readwrite) WKWebView *webView;
@property(nonatomic, strong, readwrite) UIProgressView *processView;
@property(nonatomic, strong, readwrite) NSString *articleUrl;
@end

@implementation DetailViewController

-(void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

-(instancetype)initWithUrlString:(NSString *)urlString{
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[self webView]];
    [self.view addSubview:[self processView]];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}
# pragma mark - getted
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _webView;
}

- (UIProgressView *)processView {
    if (!_processView) {
        self.processView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 10)];
    }
    return _processView;
}


# pragma mark - delegate

/// webView加载完成后的回调函数
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}


/// 监听webView加载进度的回调函数
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.processView.progress = self.webView.estimatedProgress;
}

@end
