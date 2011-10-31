//
//  ViewController.m
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PoiParser.h"
#import "DetailViewController.h"

@implementation ViewController


@synthesize parser, tableView=_tableView;;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [[[parser sections] allKeys] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{    
    return [[[[parser sections] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [[[parser sections] valueForKey:[[[[parser sections] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:section]] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[[parser sections] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {  
    
    static NSString *CellIdentifier = @"Cell";  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];  
    if (cell == nil) {  
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];  
    }  
    
    NSDictionary *aPoi = [[[parser sections] valueForKey:
                           [[[[parser sections] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[aPoi objectForKey:@"name"]];  
    [[cell detailTextLabel ] setText:[aPoi objectForKey:@"type"]];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    return cell;  
} 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *aPoi = [[[parser sections] valueForKey:
                       [[[[parser sections] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] objectAtIndex:[indexPath section]]] objectAtIndex:[indexPath row]];

    DetailViewController *dvController = [[DetailViewController alloc] init:aPoi];
    [[self navigationController ] pushViewController:dvController animated:YES];
    [dvController release];
}


#pragma mark - View lifecycle

- (void)loadView
{
    [self setTitle:@"Poi Viewer"];
    [self setParser:[[PoiParser alloc] init]];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,320,480) style:UITableViewStylePlain];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self setView:tableView];
    [self setTableView:tableView];
    [tableView release];
    
}


- (void)dealloc {
    [_tableView setDelegate:nil];
    [_tableView setDataSource:nil];
    [_tableView release];
    [parser release];
    [super dealloc];
}



@end
