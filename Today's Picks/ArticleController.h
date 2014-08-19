//
//  ArticleController.h
//  Today's Picks
//
//  Created by Dev Account on 8/19/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleController : NSObject

-(id) init;
+(NSArray*) getArticlesFromServer;

@end
