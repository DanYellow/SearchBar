//
//  ResultsTableViewController.m
//  UISearch
//
//  Created by Jean-Louis Danielo on 26/09/2015.
//  Copyright © 2015 Danielo Jean-Louis. All rights reserved.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@property (nonatomic, strong) NSArray *filteredObjects;
//@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
//    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.filteredObjects = self.results;
    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 350, 568) style:UITableViewStylePlain];
    self.tableView.dataSource = self.tableView.dataSource;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
    
    NSLog(@"%@, %@, %@", NSStringFromClass(self.presentingViewController.class), self.presentationController, self.parentViewController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.filteredObjects count];
}

- (CGFloat)tableView:(UITableView * _Nonnull)tableView heightForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    return 42.0;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;

    if (searchString.length) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", searchString];
        self.filteredObjects = [self.results filteredArrayUsingPredicate:predicate];
    } else {
        self.filteredObjects = self.results;
    }

    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomSearchViewController *A = [CustomSearchViewController new];
    A.navigationItem.leftItemsSupplementBackButton = YES;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:A];
    A.title = @"ter";
    
    nav.modalPresentationStyle = UIModalPresentationCustom;
    
    self.parentViewController.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBarHidden=YES;
    //
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSInteger foo = 5;
#pragma clang diagnostic pop
    
    self.presentingViewController.navigationItem.title = @"Search";
    [self.navigationController pushViewController:A animated:YES];
//    [self presentViewController:nav animated:YES completion: nil];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.filteredObjects objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    NSLog(@"rere");
    return YES;
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    [self.searchBar resignFirstResponder];
}



@end
