//
//  ViewController.h
//  ios-wkwebview-tab-events
//
//  Created by Craig Marvelley on 06/01/2016.
//  Copyright © 2016 Bipsync. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKScriptMessageHandler>

@property (strong, nonatomic) WKWebView *webView;

@end

