//
//  ViewController2.h
//  contestProto
//
//  Created by Kunal Desai on 10/16/14.
//  Copyright (c) 2014 myapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController
- (IBAction)likeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *likeCount;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;

@end
