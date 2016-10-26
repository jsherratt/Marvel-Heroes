//
//  NetworkManager.m
//  Marvel-Heroes
//
//  Created by Joey on 25/10/2016.
//  Copyright © 2016 Joey. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

#pragma mark <Request endpoint method>

//Request enpoint method
+(void)requestEndpoint:(NSString *)urlEndpointString completion:(void (^)(NSArray *, NSError *))completion {
    
    NSURL *url = [NSURL URLWithString:urlEndpointString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest: request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:location];
        
        if (data != nil) {
            
            NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSDictionary *JSONArrayDataDict = [JSONDict objectForKey:@"data"];
            NSArray *JSONArray = [JSONArrayDataDict valueForKey:@"results"];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
                completion(JSONArray, nil);
            }];
            
        }else {
            completion(nil, error);
        }
        
    }];
    
    [task resume];
}

@end
