//
//  MainViewController.m
//  Today's Picks
//
//  Created by Dev Account on 7/26/14.
//  Copyright (c) 2014 Sinziana Gafitanu. All rights reserved.
//

#import "MainViewController.h"
#import "OpenLinkViewController.h"
#import "math.h"
#import "ArticleController.h"
#import "ArticleObject.h"
#import "Parse/Parse.h"


@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *button10;

@property (nonatomic,retain) NSMutableArray* articleList;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
   
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFQuery* query = [PFQuery queryWithClassName:@"Article"];
    self.articleList = [[NSMutableArray alloc] init];
    [query findObjectsInBackgroundWithBlock:^(NSArray *articleFromServer, NSError *error) {
        if(!error){
            for(PFObject* article in articleFromServer){
                ArticleObject* articleObject = [[ArticleObject alloc] init];
                [articleObject initWithObject:article];
                [self.articleList addObject:articleObject];
            }
            [self addInterface];
        }
        else
        {
            NSLog(@"error in getting article list %@", error);
        }
    }];

}

-(void) addInterface
{
    [self addButton:self.button1 andText:self.text1 andInfo:self.articleList andIndex:0];
    [self addButton:self.button2 andText:self.text2 andInfo:self.articleList andIndex:1];
  //  [self addButton:self.button3 andInfo:self.articleList andIndex:2];
  //  [self addButton:self.button4 andInfo:self.articleList andIndex:3];
  //  [self addButton:self.button5 andInfo:self.articleList andIndex:4];
  //  [self addButton:self.button6 andInfo:self.articleList andIndex:5];
  //  [self addButton:self.button7 andInfo:self.articleList andIndex:6];
  //  [self addButton:self.button8 andInfo:self.articleList andIndex:7];
  //  [self addButton:self.button9 andInfo:self.articleList andIndex:8];
}


- (void) addButton:(UIButton*) button andText:(UILabel*) text andInfo:(NSMutableArray*) articleList andIndex:(NSUInteger)index
{
    if([articleList count] <= index)
        return;
    
    NSString *articleTitle = @"";
    NSString *articleCover = @"";
    
    ArticleObject* article = [articleList objectAtIndex:index];
    if(article)
    {
        articleCover = article.coverImage;
        articleTitle = article.articleTitle;
    }
    else
    {
        return;
    }
    
    if(link == nil)
        return;
    
    [button setTitle:@"" forState:UIControlStateNormal];
    
    button.frame = CGRectMake(0, 0, 320.0, 80.0);
    UIImage* myImage = [UIImage imageWithData:
                        [NSData dataWithContentsOfURL:
                         [NSURL URLWithString: articleCover]]];
    [button setBackgroundImage:[MainViewController circularScaleAndCropImage:myImage frame:button.frame] forState:UIControlStateNormal];
    [text setText:articleTitle];
    text.numberOfLines = 0;
    [self.view addSubview:text];
    [self.view addSubview:button];
    
    
}

+ (UIImage*)circularScaleAndCropImage:(UIImage*)image frame:(CGRect)frame {
    // This function returns a newImage, based on image, that has been:
    // - scaled to fit in (CGRect) rect
    // - and cropped within a circle of radius: rectWidth/2
    
    //Create the bitmap graphics context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(frame.size.width, frame.size.height), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Get the width and heights
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    CGFloat rectWidth = frame.size.height;
    CGFloat rectHeight = frame.size.height;
    
    //Calculate the scale factor
    CGFloat scaleFactorX = rectWidth/imageWidth;
    CGFloat scaleFactorY = rectHeight/imageHeight;
    
    //Calculate the centre of the circle
    CGFloat imageCentreX = rectWidth/2;
    CGFloat imageCentreY = rectHeight/2;
    
    // Create and CLIP to a CIRCULAR Path
    // (This could be replaced with any closed path if you want a different shaped clip)
    CGFloat radius = rectWidth/2;
    CGContextBeginPath (context);
    CGContextAddArc (context, imageCentreX, imageCentreY, radius, 0, 2*M_PI, 0);
    CGContextClosePath (context);
    CGContextClip (context);
    
    //Set the SCALE factor for the graphics context
    //All future draw calls will be scaled by this factor
    CGContextScaleCTM (context, scaleFactorX, scaleFactorY);
    
    // Draw the IMAGE
    CGRect myRect = CGRectMake(0, 0, imageWidth, imageHeight);
    [image drawInRect:myRect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) logEvent
{
    NSLog(@"Hello There");
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"FirstPick"]) {
        OpenLinkViewController *olvc = [segue destinationViewController];
        ArticleObject* article = [self.articleList objectAtIndex:0];
        olvc.link = article.articleUrl;
    }
    
    if ([[segue identifier] isEqualToString:@"SecondPick"]) {
        OpenLinkViewController *olvc = [segue destinationViewController];
        ArticleObject* article = [self.articleList objectAtIndex:1];
        olvc.link = article.articleUrl;
    }
}

@end
