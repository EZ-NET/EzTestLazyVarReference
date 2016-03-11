//
//  ESObject.m
//  EzTestLazyVarReference
//
//  Created by Tomohiro Kumagai on 3/11/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

#import "ESObject.h"

#define LOG(text) printf("%s (id:%s)\n", [text cStringUsingEncoding: NSUTF8StringEncoding], [_identifier cStringUsingEncoding:NSUTF8StringEncoding])

#if __has_feature(objc_arc)
#error This code needs compiler option -fno-objc-arc
#endif

@interface ESObject ()

@end

@implementation ESObject

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    
    if (self)
    {
        _identifier = [identifier copy];
    }
    
    LOG(@"😊 Alloc");
    
    return self;
}

- (NSUInteger)referenceCount
{
    return self.retainCount;
}

- (instancetype)retain OBJC_ARC_UNAVAILABLE
{
    LOG(@"😘 Retain");
    
    return [super retain];
}

- (oneway void)release OBJC_ARC_UNAVAILABLE
{
    LOG(@"😯 Release");
    
    return [super release];
}

- (instancetype)autorelease OBJC_ARC_UNAVAILABLE
{
    LOG(@"release automatically");
    
    return [super autorelease];
}

- (void)dealloc
{
    LOG(@"😇 Dealloc");
    
    [super dealloc];
}

@end
