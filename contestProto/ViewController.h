//
//  ViewController.h
//  contestProto
//
//  Created by Kunal Desai on 10/9/14.
//  Copyright (c) 2014 myapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)like:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *likeCount;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;

@end
