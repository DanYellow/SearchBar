//
//  BViewController.h
//  UISearch
//
//  Created by Danielo Jean-Louis on 18/09/2015.
//  Copyright (c) 2015 Danielo Jean-Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomSearchViewController.h"



@interface BViewController : UIViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableViewController *A;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (strong, nonatomic) UITableViewController *resultsTableView;

@property (nonatomic,assign) BOOL viewIsPushed;

@property (nonatomic, strong) NSArray *datas;

- (void) animateNavigationBar;

@end
