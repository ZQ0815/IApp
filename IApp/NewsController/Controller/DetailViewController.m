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
    self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height)];
    //添加webView视图
    [self.view addSubview:({
        self.webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height)];
        self.webView;
    })];
    //添加进度条UIProgressView
    [self.view addSubview:({
        self.processView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 10)];
        self.processView;
    })];
    //webView视图中加载指定url的内容
    [self.webView loadRequest:({
        NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]];
        request;
    })];
    //webView添加观察者(自己)，用于观察加载进度属性estimatedProgress，并且实现进度条的现实
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    decisionHandler(WKNavigationActionPolicyAllow);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    self.processView.progress = self.webView.estimatedProgress;
}

@end
