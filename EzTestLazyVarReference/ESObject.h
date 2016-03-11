//
//  ESObject.h
//  EzTestLazyVarReference
//
//  Created by Tomohiro Kumagai on 3/11/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESObject : NSObject

- (instancetype _Nonnull)initWithIdentifier:(NSString* _Nonnull)identifier;

@property (readwrite,copy,nonnull) NSString* identifier;
@property (readonly) NSUInteger referenceCount;

@end
