//
//  CustomSearchViewController.m
//  UISearch
//
//  Created by Danielo Jean-Louis on 18/09/2015.
//  Copyright (c) 2015 Danielo Jean-Louis. All rights reserved.
//

#import "CustomSearchViewController.h"

@interface CustomSearchViewController ()

@end

@implementation CustomSearchViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.isMovingFromParentViewController) {
//        CATransition* transition = [CATransition animation];
//        transition.duration = .2;
//        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//        transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
//        transition.subtype = kCATransitionFromLeft; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
//        transition.removedOnCompletion = YES;
//        [self.navigationController.view.layer addAnimation:transition forKey:nil];
//        [self.navigationController pushViewController:self.parentViewController animated:NO];
        
        
    }
}

//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    [self.navigationController.navigationBar.layer removeAllAnimations];
//    [self.navigationController.view.layer removeAllAnimations];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];
//    self.navigationController.navigationBarHidden=YES;
    self.parentViewController.navigationController.navigationBarHidden = YES;
    self.definesPresentationContext = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
