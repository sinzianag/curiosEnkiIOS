//
//  OpenLinkViewController.m
//  Today's Picks
//
//  Created by Dev Account on 7/26/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import "OpenLinkViewController.h"

@interface OpenLinkViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation OpenLinkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.link = @"http://www.google.com";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *urlAddress;
    
    if(!link)
        urlAddress = @"http://www.google.com";
    else
        urlAddress = self.link;
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.webView loadRequest:requestObj];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
