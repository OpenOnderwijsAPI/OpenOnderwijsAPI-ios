//
//  ODARequestOperation.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 21/04/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ODARequestOperation.h"
#import "NSJSONSerialization+ODARemovingNulls.h"

@interface ODARequestOperation () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, strong) ODARequestCompleteBlock completeBlock;
@property (nonatomic, assign) NSInteger httpStatusCode;
@end

@implementation ODARequestOperation

- (id)initWithBaseURL:(NSString *)baseURL accessToken:(NSString *)accessToken {
    self = [super init];
    if (self) {
        self.data = [[NSMutableData alloc] init];
        self.baseURL = baseURL;
        self.accessToken = accessToken;
    }
    return self;
}

- (void)GET:(NSString *)resourceURL onComplete:(ODARequestCompleteBlock)complete {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[self.baseURL stringByAppendingString:resourceURL]]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    if (self.accessToken) {
        [request setValue:[NSString stringWithFormat:@"Bearer %@", self.accessToken] forHTTPHeaderField:@"Authorization"];
    }
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
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&error removingNulls:YES ignoreArrays:NO];
        // We create mutablecontainers to remove the nulls, but we want the app to work with unmutable variants.
        NSDictionary *resultDict = [NSDictionary dictionaryWithDictionary:dict];
        if (self.httpStatusCode >= 400 || error) {
            // Something went wrong.
            self.completeBlock(NO, resultDict);
        } else {
            self.completeBlock(YES, resultDict);
        }
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    self.httpStatusCode = httpResponse.statusCode;
}


@end
