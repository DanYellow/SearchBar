//
//  BViewController.m
//  UISearch
//
//  Created by Danielo Jean-Louis on 18/09/2015.
//  Copyright (c) 2015 Danielo Jean-Louis. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];

    self.searchBarIsFirstResponder = NO;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Rechercher";
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
    searchBarView.backgroundColor = [UIColor clearColor];
    //    searchBarView.autoresizingMask = 0;
//    searchBar.delegate = self;
    [searchBarView addSubview:self.searchBar];
    self.navigationItem.titleView = searchBarView;
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];
    [self.searchBar becomeFirstResponder];
    [self animateNavigationBar];
    

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(0, 90, 60, 60);
    [btn addTarget:self action:@selector(section) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
//    [self.navigationController setNavigationBarHidden: YES animated:NO];
}

- (void) animateNavigationBar
{
    
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    transition.subtype = kCATransitionFromBottom; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
//    transition.delegate = self;
    [self.navigationController.navigationBar.layer addAnimation:transition forKey:nil];
}

- (BOOL)becomeFirstResponder
{
    BOOL returnValue = [super becomeFirstResponder];
    if (returnValue) {
//        [self animateNavigationBar];
    }
    return returnValue;
}


- (void) viewWillAppear:(BOOL)animated
{
    if(!self.viewIsPushed) {
        
        [self.navigationController setNavigationBarHidden:NO animated:animated];
        [self.searchBar becomeFirstResponder];
        [self animateNavigationBar];
        self.searchBarIsFirstResponder = YES;
    }
 
    self.viewIsPushed = NO;
}



- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationController.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) section
{
    [self.searchBar resignFirstResponder];

    CustomSearchViewController *A = [CustomSearchViewController new];
    self.viewIsPushed = YES;
    [self.navigationController pushViewController:A animated:YES];
}

@end
