//
//  ViewController.m
//  contestProto
//
//  Created by Kunal Desai on 10/9/14.
//  Copyright (c) 2014 myapps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;
@synthesize likeCount;
@synthesize likeButton;
NSString *imageURL = @"http://dreamtutor.org/doublie/Example1.png";
- (void)viewDidLoad
{
    
    [self sendRequest:@"0"];
    [super viewDidLoad];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageWithData:imageData];
    //[self updateLikeCount];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendRequest:(NSString*)likes{
    NSUUID *deviceId;
    deviceId = [UIDevice currentDevice].identifierForVendor;
    NSLog(@"deviceUDID: %@",deviceId);
    NSString *post = [NSString stringWithFormat:@"image=%@&like=%@&udid=%@",imageURL, likes, deviceId];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.dreamtutor.org/doublie/index.php"]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if(conn) {
        //NSLog(@"Connection Successful");
        
    } else {
        //NSLog(@"Connection could not be made");
    }
    //[likeButton setEnabled:NO];
}
- (IBAction)like:(id)sender {
    [self sendRequest:@"1"];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSRange range = [dataString rangeOfString:@","];
    
    NSString *first = [dataString substringWithRange:NSMakeRange(0, range.location)];
    NSString *second = [dataString substringFromIndex:range.location+1];
    NSLog(@"%@",first );
    NSLog(@"%@",second);
    if ([second isEqualToString:@"NO"]){
        [likeButton setEnabled:NO];
    }
    likeCount.text = first;
    
   
}
@end
