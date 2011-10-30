//
//  ViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PoiParser.h"

@implementation ViewController


@synthesize parser;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {   
    return [[parser pois] count];  
} 

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return[
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString
//                                                                             *)title atIndex:(NSInteger)index {
//    return ;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  
    
    static NSString *CellIdentifier = @"Cell";  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];  
    if (cell == nil) {  
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];  
    }  
    
    // Configure the cell...  
    NSDictionary *aPoi = [[[parser pois] objectAtIndex:[indexPath row]] objectForKey:@"poi"];  
    cell.textLabel.text = [aPoi objectForKey:@"name"];  
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;  
} 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //        DetailViewController *dvController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    //        dvController.title = title;
    //        dvController.docName = content;
    //        
    //        [self.navigationController pushViewController:dvController animated:YES];
    //        [dvController release];
    //        dvController = nil;
}


#pragma mark - View lifecycle

- (void)loadView
{
    [self setParser:[[PoiParser alloc] init]];

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 100, 200, 200) style:UITableViewStylePlain];
    
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView reloadData];
    self.view = tableView;
    
    //[self.view addSubview: tableView];
    
    [tableView release];
}





- (void)dealloc {
    [parser release];
    [super dealloc];
}



@end
