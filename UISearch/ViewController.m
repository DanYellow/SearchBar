//
//  ViewController.m
//  UISearch
//
//  Created by Danielo Jean-Louis on 18/09/2015.
//  Copyright (c) 2015 Danielo Jean-Louis. All rights reserved.
//

#import "ViewController.h"
#import "CustomSearchViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(displaySearchBar)];
    
    self.A = [BViewController new];
    self.A.viewIsPushed = NO;

    self.nav = [[UINavigationController alloc] initWithRootViewController:self.A];
    self.nav.navigationBar.barTintColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:.85f];
    self.nav.navigationBar.tintColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor purpleColor];
    btn.frame = CGRectMake(90, 90, 60, 60);
    [btn addTarget:self action:@selector(section) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
}

- (void) section {}

- (void) displaySearchBar
{
    self.nav.view.alpha = 1.0f;
    [self.navigationController.view addSubview:self.nav.view];
    [self.nav didMoveToParentViewController:self];
    
    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
