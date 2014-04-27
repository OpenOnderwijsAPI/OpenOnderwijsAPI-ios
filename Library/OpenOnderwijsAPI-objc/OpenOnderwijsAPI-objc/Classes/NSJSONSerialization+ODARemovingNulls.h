//
//  NSJSONSerialization+ODARemovingNulls.h
//  OpenOnderwijsAPI-objc
//
// This is an embedded version of https://github.com/jrturton/NSJSONSerialization-NSNullRemoval
// It's licensed under the MIT license.
//
// The reason for embedding it is so we can give it a custom prefix so it doesn't conflict with
// apps using the ODA library and a different version of this serializer.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (ODARemovingNulls)

/// As the base class method, but pass YES to remove nulls from containers, optionally ignoring those in arrays.
+(id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error removingNulls:(BOOL)removingNulls ignoreArrays:(BOOL)ignoreArrays;

@end

@interface NSMutableDictionary (RemovingNulls)

-(void)recursivelyRemoveNulls;
-(void)recursivelyRemoveNullsIgnoringArrays:(BOOL)ignoringArrays;

@end

@interface NSMutableArray (RemovingNulls)

-(void)recursivelyRemoveNulls;
-(void)recursivelyRemoveNullsIgnoringArrays:(BOOL)ignoringArrays;


@end
