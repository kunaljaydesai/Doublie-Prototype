//
//  send.m
//  contestProto
//
//  Created by Kunal Desai on 10/16/14.
//  Copyright (c) 2014 myapps. All rights reserved.
//

#import "send.h"

@implementation GlobalStuff

+ (void) sendRequest:(NSString *)likes{
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

@end
