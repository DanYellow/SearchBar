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
    

    
//    UIView *searchBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 410.0, 44.0)];
//    searchBarView.backgroundColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:1.0f];
//    [self.view addSubview:searchBarView];

    // Set the searchbar in the navigation bar
//
    self.navigationItem.titleView.backgroundColor = [UIColor clearColor];

    self.resultsTableView = [UITableViewController new];
    self.resultsTableView.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.resultsTableView.tableView.frame = self.view.bounds;
//    self.resultsTableView.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.resultsTableView.tableView.frame), CGRectGetHeight(self.resultsTableView.tableView.frame));
    NSLog(@"%f", CGRectGetHeight(self.resultsTableView.tableView.frame));
    self.resultsTableView.tableView.dataSource = self;
    self.resultsTableView.tableView.delegate = self;
    self.resultsTableView.tableView.backgroundColor = [UIColor clearColor];
    self.resultsTableView.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.resultsTableView.tableView];
    
    UILabel *messageLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                    self.resultsTableView.tableView.bounds.size.width,
                                                                    self.resultsTableView.tableView.bounds.size.height)];
    //set the message
    messageLbl.text = @"No data is avaible";
    //center the text
    messageLbl.textAlignment = NSTextAlignmentCenter;
    //auto size the text
    [messageLbl sizeToFit];
    
    
    self.resultsTableView.tableView.backgroundView = messageLbl;
    self.resultsTableView.tableView.backgroundView.hidden = YES;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.delegate = self;

    self.searchBar.barTintColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:1.0f];
    self.searchBar.tintColor = [UIColor whiteColor];
    self.searchBar.placeholder = @"Rechercher";
    self.searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTintColor:[UIColor whiteColor]];
//    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setStyle:UIBarButtonSystemItemCancel];
    [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:[UIColor whiteColor]];
    
    
    UITextField *textField = [self.searchBar valueForKey:@"_searchField"];
    textField.clearButtonMode = UITextFieldViewModeAlways;
    //    textField.textColor = [UIColor whiteColor];

//    UIView *containerSearch = [[UIView alloc] initWithFrame: self.searchBar.frame];
//    [containerSearch addSubview:self.searchBar];
    
    self.navigationItem.titleView = self.searchBar;
//    [self animateNavigationBar];
    
//    self.datas = @[@"Bulbizarre", @"Herbizarre", @"Florizarre"];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datas count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.datas count] == 0 && ![self.searchBar.text isEqualToString:@""]) {
        self.resultsTableView.tableView.backgroundView.hidden = NO;
    } else {
        self.resultsTableView.tableView.backgroundView.hidden = YES;
    }
    return 1;
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
    self.datas = @[@"Bulbasaur",
                   @"Ivysaur",
                   @"Venusaur",
                   @"Charmander",
                   @"Charmeleon",
                   @"Charizard",
                   @"Squirtle",
                   @"Wartortle",
                   @"Blastoise",
                   @"Caterpie",
                   @"Metapod",
                   @"Butterfree",
                   @"Weedle",
                   @"Kakuna",
                   @"Beedrill",
                   @"Pidgey",
                   @"Pidgeotto",
                   @"Pidgeot",
                   @"Rattata",
                   @"Raticate",
                   @"Spearow",
                   @"Fearow",
                   @"Ekans",
                   @"Arbok",
                   @"Pikachu",
                   @"Raichu",
                   @"Sandshrew",
                   @"Sandslash",
                   @"Nidoran♀",
                   @"Nidorina",
                   @"Nidoqueen",
                   @"Nidoran♂",
                   @"Nidorino",
                   @"Nidoking",
                   @"Clefairy",
                   @"Clefable",
                   @"Vulpix",
                   @"Ninetales",
                   @"Jigglypuff",
                   @"Wigglytuff",
                   @"Zubat",
                   @"Golbat",
                   @"Oddish",
                   @"Gloom",
                   @"Vileplume",
                   @"Paras",
                   @"Parasect",
                   @"Venonat",
                   @"Venomoth",
                   @"Diglett",
                   @"Dugtrio",
                   @"Meowth",
                   @"Persian",
                   @"Psyduck",
                   @"Golduck",
                   @"Mankey",
                   @"Primeape",
                   @"Growlithe",
                   @"Arcanine",
                   @"Poliwag",
                   @"Poliwhirl",
                   @"Poliwrath",
                   @"Abra",
                   @"Kadabra",
                   @"Alakazam",
                   @"Machop",
                   @"Machoke",
                   @"Machamp",
                   @"Bellsprout",
                   @"Weepinbell",
                   @"Victreebel",
                   @"Tentacool",
                   @"Tentacruel",
                   @"Geodude",
                   @"Graveler",
                   @"Golem",
                   @"Ponyta",
                   @"Rapidash",
                   @"Slowpoke",
                   @"Slowbro",
                   @"Magnemite",
                   @"Magneton",
                   @"Farfetch'd",
                   @"Doduo",
                   @"Dodrio",
                   @"Seel",
                   @"Dewgong",
                   @"Grimer",
                   @"Muk",
                   @"Shellder",
                   @"Cloyster",
                   @"Gastly",
                   @"Haunter",
                   @"Gengar",
                   @"Onix",
                   @"Drowzee",
                   @"Hypno",
                   @"Krabby",
                   @"Kingler",
                   @"Voltorb",
                   @"Electrode",
                   @"Exeggcute",
                   @"Exeggutor",
                   @"Cubone",
                   @"Marowak",
                   @"Hitmonlee",
                   @"Hitmonchan",
                   @"Lickitung",
                   @"Koffing",
                   @"Weezing",
                   @"Rhyhorn",
                   @"Rhydon",
                   @"Chansey",
                   @"Tangela",
                   @"Kangaskhan",
                   @"Horsea",
                   @"Seadra",
                   @"Goldeen",
                   @"Seaking",
                   @"Staryu",
                   @"Starmie",
                   @"Mr. Mime",
                   @"Scyther",
                   @"Jynx",
                   @"Electabuzz",
                   @"Magmar",
                   @"Pinsir",
                   @"Tauros",
                   @"Magikarp",
                   @"Gyarados",
                   @"Lapras",
                   @"Ditto",
                   @"Eevee",
                   @"Vaporeon",
                   @"Jolteon",
                   @"Flareon",
                   @"Porygon",
                   @"Omanyte",
                   @"Omastar",
                   @"Kabuto",
                   @"Kabutops",
                   @"Aerodactyl",
                   @"Snorlax",
                   @"Articuno",
                   @"Zapdos",
                   @"Moltres",
                   @"Dratini",
                   @"Dragonair",
                   @"Dragonite",
                   @"Mewtwo",
                   @"Mew",
                   @"Chikorita",
                   @"Bayleef",
                   @"Meganium",
                   @"Cyndaquil",
                   @"Quilava",
                   @"Typhlosion",
                   @"Totodile",
                   @"Croconaw",
                   @"Feraligatr",
                   @"Sentret",
                   @"Furret",
                   @"Hoothoot",
                   @"Noctowl",
                   @"Ledyba",
                   @"Ledian",
                   @"Spinarak",
                   @"Ariados",
                   @"Crobat",
                   @"Chinchou",
                   @"Lanturn",
                   @"Pichu",
                   @"Cleffa",
                   @"Igglybuff",
                   @"Togepi",
                   @"Togetic",
                   @"Natu",
                   @"Xatu",
                   @"Mareep",
                   @"Flaaffy",
                   @"Ampharos",
                   @"Bellossom",
                   @"Marill",
                   @"Azumarill",
                   @"Sudowoodo",
                   @"Politoed",
                   @"Hoppip",
                   @"Skiploom",
                   @"Jumpluff",
                   @"Aipom",
                   @"Sunkern",
                   @"Sunflora",
                   @"Yanma",
                   @"Wooper",
                   @"Quagsire",
                   @"Espeon",
                   @"Umbreon",
                   @"Murkrow",
                   @"Slowking",
                   @"Misdreavus",
                   @"Unown",
                   @"Wobbuffet",
                   @"Girafarig",
                   @"Pineco",
                   @"Forretress",
                   @"Dunsparce",
                   @"Gligar",
                   @"Steelix",
                   @"Snubbull",
                   @"Granbull",
                   @"Qwilfish",
                   @"Scizor",
                   @"Shuckle",
                   @"Heracross",
                   @"Sneasel",
                   @"Teddiursa",
                   @"Ursaring",
                   @"Slugma",
                   @"Magcargo",
                   @"Swinub",
                   @"Piloswine",
                   @"Corsola",
                   @"Remoraid",
                   @"Octillery",
                   @"Delibird",
                   @"Mantine",
                   @"Skarmory",
                   @"Houndour",
                   @"Houndoom",
                   @"Kingdra",
                   @"Phanpy",
                   @"Donphan",
                   @"Porygon2",
                   @"Stantler",
                   @"Smeargle",
                   @"Tyrogue",
                   @"Hitmontop",
                   @"Smoochum",
                   @"Elekid",
                   @"Magby",
                   @"Miltank",
                   @"Blissey",
                   @"Raikou",
                   @"Entei",
                   @"Suicune",
                   @"Larvitar",
                   @"Pupitar",
                   @"Tyranitar",
                   @"Lugia",
                   @"Ho-oh",
                   @"Celebi",
                   @"Treecko",
                   @"Grovyle",
                   @"Sceptile",
                   @"Torchic",
                   @"Combusken",
                   @"Blaziken",
                   @"Mudkip",
                   @"Marshtomp",
                   @"Swampert",
                   @"Poochyena",
                   @"Mightyena",
                   @"Zigzagoon",
                   @"Linoone",
                   @"Wurmple",
                   @"Silcoon",
                   @"Beautifly",
                   @"Cascoon",
                   @"Dustox",
                   @"Lotad",
                   @"Lombre",
                   @"Ludicolo",
                   @"Seedot",
                   @"Nuzleaf",
                   @"Shiftry",
                   @"Taillow",
                   @"Swellow",
                   @"Wingull",
                   @"Pelipper",
                   @"Ralts",
                   @"Kirlia",
                   @"Gardevoir",
                   @"Surskit",
                   @"Masquerain",
                   @"Shroomish",
                   @"Breloom",
                   @"Slakoth",
                   @"Vigoroth",
                   @"Slaking",
                   @"Nincada",
                   @"Ninjask",
                   @"Shedinja",
                   @"Whismur",
                   @"Loudred",
                   @"Exploud",
                   @"Makuhita",
                   @"Hariyama",
                   @"Azurill",
                   @"Nosepass",
                   @"Skitty",
                   @"Delcatty",
                   @"Sableye",
                   @"Mawile",
                   @"Aron",
                   @"Lairon",
                   @"Aggron",
                   @"Meditite",
                   @"Medicham",
                   @"Electrike",
                   @"Manectric",
                   @"Plusle",
                   @"Minun",
                   @"Volbeat",
                   @"Illumise",
                   @"Roselia",
                   @"Gulpin",
                   @"Swalot",
                   @"Carvanha",
                   @"Sharpedo",
                   @"Wailmer",
                   @"Wailord",
                   @"Numel",
                   @"Camerupt",
                   @"Torkoal",
                   @"Spoink",
                   @"Grumpig",
                   @"Spinda",
                   @"Trapinch",
                   @"Vibrava",
                   @"Flygon",
                   @"Cacnea",
                   @"Cacturne",
                   @"Swablu",
                   @"Altaria",
                   @"Zangoose",
                   @"Seviper",
                   @"Lunatone",
                   @"Solrock",
                   @"Barboach",
                   @"Whiscash",
                   @"Corphish",
                   @"Crawdaunt",
                   @"Baltoy",
                   @"Claydol",
                   @"Lileep",
                   @"Cradily",
                   @"Anorith",
                   @"Armaldo",
                   @"Feebas",
                   @"Milotic",
                   @"Castform",
                   @"Kecleon",
                   @"Shuppet",
                   @"Banette",
                   @"Duskull",
                   @"Dusclops",
                   @"Tropius",
                   @"Chimecho",
                   @"Absol",
                   @"Wynaut",
                   @"Snorunt",
                   @"Glalie",
                   @"Spheal",
                   @"Sealeo",
                   @"Walrein",
                   @"Clamperl",
                   @"Huntail",
                   @"Gorebyss",
                   @"Relicanth",
                   @"Luvdisc",
                   @"Bagon",
                   @"Shelgon",
                   @"Salamence",
                   @"Beldum",
                   @"Metang",
                   @"Metagross",
                   @"Regirock",
                   @"Regice",
                   @"Registeel",
                   @"Latias",
                   @"Latios",
                   @"Kyogre",
                   @"Groudon",
                   @"Rayquaza",
                   @"Jirachi",
                   @"Deoxys"];
    
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
//        [self.searchBar becomeFirstResponder];
// If user allowed to push so he write some content then we rearmed the cancel button
        [self rearmedCancelButton];
    }

    self.viewIsPushed = NO;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.searchBar resignFirstResponder];
    
    CustomSearchViewController *A = [CustomSearchViewController new];
    self.viewIsPushed = YES;
////    A.view.alpha = 0;
    [self.navigationController pushViewController:A animated:YES];
////    [UIView animateWithDuration:0.5
//                     animations:^{A.view.alpha = 1.0;}];
    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDuration:0.75];
   
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.navigationController.view cache:NO];
//    [UIView commitAnimations];
    
//    CATransition* transition = [CATransition animation];
//    transition.duration = 0.5;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    transition.type = kCATransitionPush; //kCATransitionMoveIn; //, kCATransitionPush, kCATransitionReveal, kCATransitionFade
//    transition.subtype = kCATransitionFromRight; //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//     [self.navigationController pushViewController:A animated:NO];
//    [[self navigationController] popViewControllerAnimated:NO];
}

- (void) scrollViewWillBeginDragging:(UITableView *)tableView
{
    // When the user starts to scroll we hide the keyboard
    // only if the
    if (![self.searchBar.text isEqualToString:@""]) {
        [self.searchBar resignFirstResponder];
        [self rearmedCancelButton];
    }
}

- (void) rearmedCancelButton
{
    for(UIButton *subview in [[[self.searchBar subviews] objectAtIndex:0] subviews])
    {
        if ([subview isKindOfClass:[UIButton class]]) {
            [subview setEnabled:YES];
        }
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [UIView transitionWithView:self.view
                      duration:UINavigationControllerHideShowBarDuration
                       options:UIViewAnimationOptionCurveEaseOut
                    animations:^{
                        [self.navigationController setNavigationBarHidden:YES animated:YES];
                        self.navigationController.view.alpha = 0;
                        
//                        self.navigationController.navigationBar.alpha = 0;
//                        self.view.alpha = 0;
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
