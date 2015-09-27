//
//  ResultsTableViewController.h
//  UISearch
//
//  Created by Jean-Louis Danielo on 26/09/2015.
//  Copyright © 2015 Danielo Jean-Louis. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomSearchViewController.h"


@interface ResultsTableViewController : UITableViewController <UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *results;

@end
