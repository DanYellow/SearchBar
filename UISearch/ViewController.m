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

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.definesPresentationContext = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(displaySearchBar)];
    
//    self.A = [BViewController new];
//    self.A.viewIsPushed = NO;

//    self.nav = [[UINavigationController alloc] initWithRootViewController:self.A];
//    self.nav.navigationBar.barTintColor = [UIColor colorWithRed:(2.0/255.0f) green:(17.0/255.0f) blue:(28.0/255.0f) alpha:.85f];
//    self.nav.navigationBar.tintColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor purpleColor];
    btn.frame = CGRectMake(90, 90, 60, 60);
    [btn addTarget:self action:@selector(section) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
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
                   @"Mew"];
}

- (void) section {}

- (void) displaySearchBar
{
//    self.nav.view.alpha = 1.0f;
//    [self.navigationController.view addSubview:self.nav.view];
//    [self.nav didMoveToParentViewController:self];
    
    
    ResultsTableViewController *controller = [ResultsTableViewController new];
    controller.results = self.datas;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    nav.navigationBar.tintColor = [UIColor redColor];
    nav.navigationBar.barTintColor = [UIColor blackColor];

    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nav];
    self.searchController.searchResultsUpdater = controller;
    self.searchController.hidesNavigationBarDuringPresentation = YES;
//    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.delegate = controller;
    self.searchController.searchBar.tintColor = [UIColor redColor];
    self.searchController.searchBar.barTintColor = [UIColor blackColor];
    
//    self.definesPresentationContext = YES;
    
    [self presentViewController:self.searchController animated:YES completion: nil];

//    [self.searchController presentViewController:nav animated:YES completion:nil];
    
    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
