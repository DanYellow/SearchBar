//
//  BViewController.h
//  UISearch
//
//  Created by Danielo Jean-Louis on 18/09/2015.
//  Copyright (c) 2015 Danielo Jean-Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomSearchViewController.h"



@interface BViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, strong) UITableViewController *A;
@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic,assign) BOOL viewIsPushed;

- (void) animateNavigationBar;

@end
