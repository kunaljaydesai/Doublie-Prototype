//
//  ViewController2.m
//  contestProto
//
//  Created by Kunal Desai on 10/16/14.
//  Copyright (c) 2014 myapps. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize imageView;
@synthesize likeCount;
@synthesize likeButton;
NSString *imageURLz = @"http://cdn.idolator.com/wp-content/uploads/2010/07/pole.jpg";
- (void)viewDidLoad {
    [self sendRequest:@"0"];
    [super viewDidLoad];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURLz]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageWithData:imageData];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendRequest:(NSString*)likes{
    NSUUID *deviceId;
    deviceId = [UIDevice currentDevice].identifierForVendor;
    NSLog(@"deviceUDID: %@",deviceId);
    NSString *post = [NSString stringWithFormat:@"image=%@&like=%@&udid=%@",imageURLz, likes, deviceId];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)likeButton:(id)sender {
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
