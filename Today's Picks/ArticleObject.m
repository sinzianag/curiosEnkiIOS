//
//  Article.m
//  Today's Picks
//
//  Created by Dev Account on 8/19/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import "ArticleObject.h"

@implementation ArticleObject

NSString* const identifierKey = @"id";
NSString* const articleTitleKey = @"articleTitle";
NSString* const articleUrlKey = @"articleUrl";
NSString* const coverImageKey = @"coverImage";
NSString* const tags = @"tags";

@synthesize identifier = _identifier;
@synthesize articleTitle = _articleTitle;
@synthesize articleUrl = _articleUrl;
@synthesize coverImage = _coverImage;
@synthesize tags = _tags;

-(void) initWithObject:(PFObject*) articleObject
{
        self.identifier = articleObject[identifierKey];
        self.articleTitle = articleObject[articleTitleKey];
        self.articleUrl = articleObject[articleUrlKey];
        self.coverImage = articleObject[coverImageKey];
        self.tags = articleObject[tags];
}

@end
