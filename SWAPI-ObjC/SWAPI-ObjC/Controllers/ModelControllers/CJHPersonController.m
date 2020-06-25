//
//  CJHPersonController.m
//  SWAPI-ObjC
//
//  Created by Connor Holland on 6/25/20.
//  Copyright © 2020 Connor Holland. All rights reserved.
//

#import "CJHPersonController.h"

static NSString * const baseURLString = @"https://swapi.dev/api";
static NSString * const peopleComp = @"people";

@implementation CJHPersonController

+ (void)fetchPersonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(CJHPerson * _Nullable))completion
{
    //URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *peopleComponent = [baseURL URLByAppendingPathComponent:peopleComp];
    NSURL *finalURL = [peopleComponent URLByAppendingPathComponent:searchTerm];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error fetching the pokemon - %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        
        if (data) {
            NSDictionary *topLevel = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevel) {
                NSLog(@"Error parsing the data: %@", error);
                return completion(nil);
            }
            
            CJHPerson *person = [[CJHPerson alloc] initWithDictionary:topLevel];
            completion(person);
        }
        
    }]resume];
}


@end
