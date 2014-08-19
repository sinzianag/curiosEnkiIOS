//
//  ArticleController.m
//  Today's Picks
//
//  Created by Dev Account on 8/19/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import "ArticleController.h"
#import "ArticleObject.h"
#import "Parse/Parse.h"

@implementation ArticleController

-(id) init
{
    if(self = [super init])
    {
        return self;
        //TODO: Get articles
    }
    return nil;
}

+(NSArray*) getArticlesFromServer
{
    NSMutableArray* articleList = [NSMutableArray array];
    PFQuery* query = [PFQuery queryWithClassName:@"Article"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *articleFromServer, NSError *error) {
        if(!error){
       //     for(PFObject* article in articleFromServer){
        //        ArticleObject* articleObject = [ArticleObject init];
           //     [articleList addObject:[articleObject initWithObject:article]];
         //   }
        }
        else
        {
            NSLog(@"error in getting article list %@", error);
        }
    }];
    return articleList;
}



@end
