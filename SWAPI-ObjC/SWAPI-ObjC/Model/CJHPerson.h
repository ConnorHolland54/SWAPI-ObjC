//
//  CJHPerson.h
//  SWAPI-ObjC
//
//  Created by Connor Holland on 6/25/20.
//  Copyright © 2020 Connor Holland. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CJHPerson : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *height;

- (instancetype)initWithName:(NSString *)name height:(NSString *)height;

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;


@end

NS_ASSUME_NONNULL_END
