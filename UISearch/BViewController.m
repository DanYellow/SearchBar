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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    

    
//    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 310.0, 44.0)];
//    searchBarView.backgroundColor = [UIColor clearColor];
//    [searchBarView addSubview:self.searchBar];

    // Set the searchbar in the navigation bar
//
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];
    
    self.resultsTableView = [UITableViewController new];
    self.resultsTableView.tableView.frame = CGRectMake(0, 0, 320, 500);
    self.resultsTableView.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.resultsTableView.tableView.dataSource = self;
    self.resultsTableView.tableView.delegate = self;
    self.resultsTableView.tableView.backgroundColor = [UIColor clearColor];
    self.resultsTableView.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.resultsTableView.tableView];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.delegate = self;

//    self.searchBar.barTintColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:1.0f];
    self.searchBar.tintColor = [UIColor whiteColor];
    self.searchBar.placeholder = @"Rechercher";
    self.searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [[UIBarButtonItem appearanceWhenContainedIn: [UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];

//    UIView *containerSearch = [[UIView alloc] initWithFrame: self.searchBar.frame];
//    [containerSearch addSubview:self.searchBar];
    
    self.navigationItem.titleView = self.searchBar;
//    [self animateNavigationBar];
    
    self.datas = @[@"Bulbizarre", @"Herbizarre", @"Florizarre"];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datas count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (aCell == nil) {
        aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    aCell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    
    return aCell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.datas = @[@"Bulbizarre", @"Herbizarre", @"Florizarre"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(self BEGINSWITH[c] %@)", searchText];
    [self.datas filteredArrayUsingPredicate:predicate];
    
    self.datas = [self.datas filteredArrayUsingPredicate:predicate];
    
    [self.resultsTableView.tableView reloadData];
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    selectedTextFieldTag = textField.tag;
    return NO;
}



- (void) animateNavigationBar
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.25;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    [self.navigationController.navigationBar.layer addAnimation:transition forKey:nil];
}



- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:.85f];

    if(!self.viewIsPushed) {
        [self.searchBar becomeFirstResponder];
        [self animateNavigationBar];
        
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    } else {
        [self.searchBar becomeFirstResponder];
    }
 
    self.viewIsPushed = NO;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [self.searchBar resignFirstResponder];
    
    CustomSearchViewController *A = [CustomSearchViewController new];
    self.viewIsPushed = YES;
    [self.navigationController pushViewController:A animated:YES];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [UIView transitionWithView:self.view
                      duration:UINavigationControllerHideShowBarDuration
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                        [self.navigationController setNavigationBarHidden:YES animated:YES];
                    }
                    completion:^(BOOL finished){
                        [self.navigationController.view removeFromSuperview];
                    }];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self.navigationController.view removeFromSuperview];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) section
{
    
}

@end
