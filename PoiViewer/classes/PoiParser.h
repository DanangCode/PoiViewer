//
//  PoiParser.h
//  PoiViewer
//
//  Created by Greg Ball on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoiParser : NSObject
-(NSArray *)loadPOIs; 
-(void)createSections;

@property (nonatomic,retain) NSMutableDictionary *sections;

@end
