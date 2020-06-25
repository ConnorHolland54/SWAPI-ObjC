//
//  CJHPersonController.h
//  SWAPI-ObjC
//
//  Created by Connor Holland on 6/25/20.
//  Copyright © 2020 Connor Holland. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJHPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface CJHPersonController : NSObject

+ (void)fetchPersonWithSearchTerm:(NSString *)searchTerm completion:(void(^)(CJHPerson *))completion;


@end

NS_ASSUME_NONNULL_END
