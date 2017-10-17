//
//  NetworkHelper.m
//  weatherGrettings
//
//  Created by Ankam Mounika on 12/18/16.
//  Copyright © 2016 Mounika. All rights reserved.
//

#import "NetworkHelper.h"


@implementation NetworkHelper

+(void)getWeatherGreetingsFromstate:(NSString *)state
                           city:(NSString *)city
                           success:(void(^) (NSDictionary *dataDictinaory))successBlock
                           failure:(void(^) (NSError *error))failureblock{
    
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"http://api.wunderground.com/api/2c327fe0f181f61a/conditions/q/%@/%@.json", state, city]];
   
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:URL];
//    NSString *body=[NSString stringWithFormat:@"city=%@&state=%@",city, state];
//    [request setHTTPMethod:@"POST"];
//    request.HTTPBody=[body dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if(!error)
                                          {
                                              
                                              NSError *serializationerror;
                                              NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                           options:NSJSONReadingAllowFragments       error:&serializationerror];
                                              
                                              if(!serializationerror)
                                              {
                                                 
                                                  successBlock(responseDict);
                                              }
                                              else{
                                                  failureblock(error);
                                              }
                                          }
                                          else {
                                              failureblock(error);
                                          }
                                          
                                      }];
    
    [dataTask resume];
}


@end
