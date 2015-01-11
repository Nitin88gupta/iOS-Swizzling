//
//  NGViewController.m
//  iOSSwizzlingSample
//
//  Created by Nitin Gupta on 6/2/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /// Swizzling
    NSLog(@"%@",[[NSObject new] description]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
