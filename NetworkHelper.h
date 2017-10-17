//
//  NetworkHelper.h
//  weatherGrettings
//
//  Created by Ankam Mounika on 12/18/16.
//  Copyright © 2016 Mounika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

+(void)getWeatherGreetingsFromstate:(NSString *)state
                               city:(NSString *)city
                            success:(void(^) (NSDictionary *dataDictinaory))successBlock
                            failure:(void(^) (NSError *error))failureblock;
@end
