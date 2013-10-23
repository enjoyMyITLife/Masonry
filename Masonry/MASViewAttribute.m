//
//  MASAttribute.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASViewAttribute.h"

@implementation MASViewAttribute

- (id)initWithView:(MAS_VIEW *)view layoutAttribute:(NSLayoutAttribute)layoutAttribute {
    self = [super init];
    if (!self) return nil;
    
    _view = view;
    _layoutAttribute = layoutAttribute;
    
    return self;
}

- (BOOL)isSizeAttribute {
    return self.layoutAttribute == NSLayoutAttributeWidth || self.layoutAttribute == NSLayoutAttributeHeight;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:self.class]) {
        MASViewAttribute *attr = object;
        return ([self.view isEqual:attr.view] && self.layoutAttribute == attr.layoutAttribute);
    }
    return [super isEqual:object];
}

- (NSUInteger)hash {
    return MAS_NSUINTROTATE([self.view hash], MAS_NSUINT_BIT / 2) ^ self.layoutAttribute;
}

@end
