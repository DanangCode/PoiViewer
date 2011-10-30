//
//  PoiParser.h
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoiParser : NSObject{
    NSArray *pois;
    NSMutableDictionary *sections;
}

-(void)loadPOIs; 
-(void)createSections;

@property(nonatomic,retain) NSArray *pois;
@property (nonatomic,retain) NSMutableDictionary *sections;

@end
