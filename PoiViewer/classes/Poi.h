//
//  Poi.h
//  PoiViewer
//
//  Created by Greg Ball on 10/31/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Poi : NSObject

@property(nonatomic, retain) NSDictionary *poi;

-(NSString *)name;
-(NSMutableString *)shopType;
-(NSMutableString *)address;
-(NSString *)review;
-(id)init:(NSDictionary *)aPoi;

@end
