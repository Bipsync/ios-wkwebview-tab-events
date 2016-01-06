//
//  ViewController.m
//  ios-wkwebview-tab-events
//
//  Created by Craig Marvelley on 06/01/2016.
//  Copyright © 2016 Bipsync. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    [configuration.userContentController addScriptMessageHandler:self name:@"editor"];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    
    [self loadEditorResources];
    
}

- (void)loadEditorResources {
    
    NSString *editorHtmlFilePath = [[NSBundle mainBundle] pathForResource:@"editor" ofType:@"html"];
    NSString *editorHtml = [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:editorHtmlFilePath] encoding:NSUTF8StringEncoding];
    
    [_webView loadHTMLString:editorHtml baseURL:nil];
    
}

#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    if ([message.body isKindOfClass:[NSString class]]) {
        NSString *body = (NSString *)message.body;
        NSLog(@"%@", body);
    }
    
}

@end
