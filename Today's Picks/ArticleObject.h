//
//  Article.h
//  Today's Picks
//
//  Created by Dev Account on 8/19/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface ArticleObject : NSObject {
    NSString* _identifier;
    NSString* _articleTitle;
    NSString* _articleUrl;
    NSString* _coverImage;
    NSString* _tags;
}

@property (nonatomic,retain) NSString* identifier;
@property (nonatomic,retain) NSString* articleTitle;
@property (nonatomic,retain) NSString* articleUrl;
@property (nonatomic,retain) NSString* coverImage;
@property (nonatomic,retain) NSString* tags;

-(void) initWithObject:(PFObject*) articleObject;

@end
