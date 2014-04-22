//
//  ODARequestOperation.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODARequestOperation.h"

@interface ODARequestOperation () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) ODARequestCompleteBlock completeBlock;

@end

@implementation ODARequestOperation

- (id)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    if (self) {
        self.data = [[NSMutableData alloc] init];
        self.baseURL = baseURL;
    }
    return self;
}

- (void)GET:(NSString *)resourceURL onComplete:(ODARequestCompleteBlock)complete {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[self.baseURL stringByAppendingString:resourceURL]]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.completeBlock = complete;
    self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    [self.connection start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    if (self.completeBlock) {
        self.completeBlock(NO, nil);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    if (self.completeBlock) {
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.data options:0 error:&error];
        if (!error) {
            self.completeBlock(YES, dict);
        } else {
            self.completeBlock(NO, nil);
        }
    }
}


@end
