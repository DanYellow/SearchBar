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
//    
//    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//    self.window.backgroundColor = [UIColor redColor];
////    self.window.windowLevel = UIWindowLevelAlert;
//    [self.window makeKeyAndVisible];
    
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //do something like background color, title, etc you self
    [self.view addSubview:navbar];
    
    
    self.A = [BViewController new];
    self.A.searchBarIsFirstResponder = NO;
    self.A.viewIsPushed = NO;
    [self.A.searchBar becomeFirstResponder];

    self.nav = [[UINavigationController alloc] initWithRootViewController:self.A];
//    self.A.view.alpha = 0;
    
//
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor purpleColor];
    btn.frame = CGRectMake(90, 90, 60, 60);
    [btn addTarget:self action:@selector(section) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
//    [self addChildViewController:A];
    
   
//    [self.navigationController.view addSubview:self.A.view];
//    [self.view insertSubview:self.A.view atIndex:0];
    // [self.navigationController.navigationBar insertSubview:self.A.view atIndex:0];
//    [self.A didMoveToParentViewController:self];
    
    
}

- (void) displaySearchBar
{
//        self.A.view.alpha = 1;
    CATransition* transition = [CATransition animation];
    transition.duration = .25;
//    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
//    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    BViewController *A = [BViewController new];
//    A.view.backgroundColor = [UIColor clearColor];
//    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    self.definesPresentationContext = YES;
//    self.modalPresentationStyle = YES;
    
    [self.navigationController.view addSubview:self.nav.view];

    
//    [self.nav willMoveToParentViewController:self];
////    [self.view addSubview:self.nav.view];
//    [self addChildViewController:self.nav];
//    [self.nav didMoveToParentViewController:self];
//
//    [self presentViewController:nav animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
