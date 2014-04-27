//
//  ODAViewController.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 30/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ViewController.h"
#import <OpenOnderwijsAPI/OpenOnderwijsAPI.h>
#import <NXOAuth2Client/NXOAuth2.h>

#define BASE_URL @"http://localhost:8000"

// If you want to use OAUTH in the demo, you have to set OAUTH up first on the
// server.
// If you leave this to 0, the demo will run without oauth. (the personal data call will then fail because of an
// invalid token but the rest will still work).
#define USE_OAUTH 0

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, copy) NSString *accessToken;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = @"";
    
    // Perform a fake OAuth login to the reference API.
#if USE_OAUTH
    [[NXOAuth2AccountStore sharedStore] setClientID:@"56cfb7bd4a8869fb6db4"
                                             secret:@"c29a0bdd24b0db7626d4643029e0da245efddf13"
                                   authorizationURL:[NSURL URLWithString:@""]
                                           tokenURL:[NSURL URLWithString:[BASE_URL stringByAppendingString:@"/oauth2/access_token"]]
                                        redirectURL:[NSURL URLWithString:@""]
                                     forAccountType:@"OpenOnderwijsDemo"];
    
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:@"OpenOnderwijsDemo"
                                                              username:@"admin"
                                                              password:@"admin"];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:NXOAuth2AccountStoreAccountsDidChangeNotification
                                                      object:[NXOAuth2AccountStore sharedStore]
                                                       queue:nil
                                                  usingBlock:^(NSNotification *aNotification){
                                                      
                                                      NXOAuth2Account *account = [aNotification.userInfo objectForKey:NXOAuth2AccountStoreNewAccountUserInfoKey];
                                                      self.accessToken = account.accessToken.accessToken;
                                                      
                                                      // Create a new client for our API
                                                      ODAClient *apiClient = [[ODAClient alloc] initWithBaseURL:BASE_URL];
                                                      [self testAllApis: apiClient];
                                                      
                                                  }];
#else 
    // Create a new client for our API
    ODAClient *apiClient = [[ODAClient alloc] initWithBaseURL:BASE_URL];
    [self testAllApis: apiClient];
#endif
}

- (void)appendLog:(NSString *)logEntry {
    self.textView.text = [NSString stringWithFormat:@"%@%@\n", self.textView.text, logEntry];
}

- (void)testAllApis:(ODAClient *)apiClient {
    
    // Note: all output will appear out of order in the output screen. This is because
    // all calls are called asynchronously, there's no guarantee which finishes first.
    // This is perfectly normal but looks confusing if you run the demo for the first time.
    
    /**
     * PERSONS
     */
    // Retrieve the persons info using the PersonsClient
    // we do not add any additional parameters here, so we use null at the params.
    [apiClient.personsClient getById:@"1" onComplete:^(BOOL success, ODAPerson *person) {
        
        if (success) {
            // display the name of the first person
            [self appendLog:[NSString stringWithFormat:@"The first person is called: %@", person.displayName]];
        } else {
            [self appendLog:@"Error in getting first person :-("];
        }
    }];
    
    // create a params object, and set the page to 1, also search to persons with the name 'Bibber'
    ODAParameters *listParams = [[ODAParameters alloc] init];
    listParams.page = 1;
    listParams.searchQuery = @"bibber";

    // get the list of the persons on the first page
    [apiClient.personsClient getList:listParams onComplete:^(BOOL success, NSArray *personList) {
     
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %lu persons on the first page named 'bigger'.", (unsigned long)[personList count]]];
        } else {
            [self appendLog:@"Error in listing persons of first page :-("];
        }
    }];
    
    // Retrieve my personal data
    apiClient.personsClient.accessToken = self.accessToken;
    [apiClient.personsClient getMeOnComplete:^(BOOL success, ODAPerson *person) {
        
        if (success) {
            // display the name of the first person
            [self appendLog:[NSString stringWithFormat:@"My name is: %@", person.displayName]];
        } else {
            [self appendLog:[NSString stringWithFormat:@"Error in getting personal data :-( (reason: %@)", apiClient.personsClient.lastError]];
        }
    }];
    apiClient.personsClient.accessToken = nil;
    
    
    /**
     * BUILDINGS
     */
    [apiClient.buildingsClient getById:@"1" onComplete:^(BOOL success, ODABuilding *building) {
        
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"The building with the ID '1' is located at %@", building.address]];
        } else {
            [self appendLog:@"Error in getting building with ID: '1' :-("];
        }
    }];
    
    ODAParameters *buildingParams = [[ODAParameters alloc] init];
    buildingParams.page = 1;

    [apiClient.buildingsClient getList:buildingParams onComplete:^(BOOL success, NSArray *buildingList) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %lu buildings on the first page", (unsigned long)[buildingList count]]];
        } else {
            [self appendLog:@"Error in listing first page of buildings :-("];
        }
    }];
    
    /**
     * ROOMS
     */
    [apiClient.roomsClient getById:@"1" onComplete:^(BOOL success, ODARoom *room) {
        
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"The room with the ID '1' has %ld seats", (long)room.totalSeats]];
        } else {
            [self appendLog:@"Error in getting room with ID: '1' :-("];
        }
    }];
    
    ODAParameters *roomParams = [[ODAParameters alloc] init];
    roomParams.page = 1;
    
    [apiClient.roomsClient getList:roomParams onComplete:^(BOOL success, NSArray *roomList) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %lu rooms on the first page", (unsigned long)[roomList count]]];
        } else {
            [self appendLog:@"Error in listing first page of rooms :-("];
        }
    }];
        
    /**
     * GROUPS
     */
    [apiClient.groupsClient getById:@"1" onComplete:^(BOOL success, ODAGroup *group) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"The group with the id '1' has %lu member(s), and its name is %@", (unsigned long)[group.members count], group.name]];
        } else {
            [self appendLog:@"Error getting info about the group with id '1' :-("];
        }
    }];
    
    ODAParameters *groupParams = [[ODAParameters alloc] init];
    groupParams.page = 1;

    [apiClient.groupsClient getList:groupParams onComplete:^(BOOL success, NSArray *list) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %lu groups on the first page", (unsigned long)[list count]]];
        } else {
            [self appendLog:@"Error in listing first page of groups :-("];
        }
    }];
        
    /**
     * AFFILIATIONS
     */
    // get the info about the affiliation with the id '2'
    [apiClient.affiliationsClient getById:@"2" onComplete:^(BOOL success, ODAAffiliation *affiliation) {
        
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"The second affiliation has %lu persons", (unsigned long)[affiliation.personUrls count]]];
        } else {
            [self appendLog:@"Error getting info about the second affiliation :-("];
        }
        
    }];
    
    // get the number of the affiliations on the first page
    ODAParameters *affiliationParams = [[ODAParameters alloc] init];
    affiliationParams.page = 1;
    [apiClient.affiliationsClient getList:affiliationParams onComplete:^(BOOL success, NSArray *list) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %d affiliations on the first page", [list count]]];
        } else {
            [self appendLog:@"Error in listing first page of affiliations :-("];
        }
    }];
    
    /**
     * NEWS ITEMS
     */
    // get the info about the first news item
    [apiClient.newsItemsClient getById:@"1" onComplete:^(BOOL success, ODANewsItem *newsItem) {
        
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"The first news item was published at %@", newsItem.publicationDate]];
        } else {
            [self appendLog:@"Error getting info about the first news item :-("];
        }
    }];
    // get the number of the news items on the first page
    [apiClient.newsItemsClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %d news items on the first page.", [list count]]];
        } else {
            [self appendLog:@"Error listing the first page of the news items :-("];
        }
    }];
    
    /**
     * NEWS FEEDS
     */
    // get the info about the first newsfeed
    [apiClient.newsFeedsClient getById:@"1" onComplete:^(BOOL success, ODANewsFeed *newsFeed) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first news feed has %d items.", [newsFeed.items count]]];
        } else {
            // inform the user about the error.
            [self appendLog:@"Error getting info about the first newsfeed :-("];
            
        }
    }];
    // get the number of the newsfeeds on the first page
    [apiClient.newsFeedsClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d newsfeeds on the first page.", [list count]]];
        } else {
            // inform the user about the error
            [self appendLog:@"Error listing the first page of the newsfeeds :-("];
            
        }
    }];
    
    /**
     * GROUP ROLES
     */
    // get the info about the first news item
    [apiClient.groupRolesClient getById:@"1" onComplete:^(BOOL success, ODAGroupRole *groupRole) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first role's name is: %@.", groupRole.role]];
        } else {
            // inform the user about the error.
            [self appendLog:@"Error getting info about the first group role :-("];
            
        }
    }];
    // get the number of group roles on the first page
    [apiClient.groupRolesClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d group roles on the first page.", [list count]]];
        } else {
            // inform the user about the error
            [self appendLog:@"Error listing the first page of the group roles :-("];
            
        }
    }];
    
    /**
     * COURSES
     */
   [apiClient.coursesClient getById:@"1" onComplete:^(BOOL success, ODACourse* course) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first course is called %@.", course.name]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting first course :-("];
            
        }
    }];
    [apiClient.coursesClient getList:nil onComplete:^(BOOL success, NSArray *list) {
         
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d courses on the first page.", [list count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error listing first page of courses :-("];
        }
    }];
    
    /**
     * LESSONS
     */
    [apiClient.scheduleClient getById:@"1" onComplete:^(BOOL success, ODALesson* lesson) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first lesson starts at: %@", lesson.start]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting first lesson :-("];
            
        }
    }];
    [apiClient.scheduleClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d lessons on the first page.", [list count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error listing first page of lessons :-("];
            
        }
    }];
    
    /**
     * SCHEDULE OF A PERSON
     */
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    ODAParameters *scheduleParams = [[ODAParameters alloc] init];
    scheduleParams.startDate = [formatter dateFromString:@"1996-01-01"];
    scheduleParams.endDate = [NSDate date];
    
    [apiClient.scheduleClient getScheduleByPerson:@"1" params:scheduleParams onComplete:^(BOOL success, NSArray *lessons) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first person has %d lessons.",[lessons count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting the schedule of the first person."];
            
        }
    }];
    
    /**
     * COURSE RESULTS
     */
    [apiClient.courseResultsClient getById:@"1" onComplete:^(BOOL success, ODACourseResult *courseResult) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first course result's grade is: %@", courseResult.grade]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting first course result :-("];
            
        }
    }];
    [apiClient.courseResultsClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d course results on the first page.", [list count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error listing first page of course results :-("];
            
        }
    }];
    
    /**
     * TEST RESULTS
     */
    [apiClient.testResultsClient getById:@"1" onComplete:^(BOOL success, ODATestResult *testResult) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first test result's date is: %@",  testResult.date]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting first test result :-("];
        }
    }];
    [apiClient.testResultsClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d test results on the first page.", [list count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error listing first page of test results :-("];
        }
    }];
    
    /**
     * MINORS
     */
    [apiClient.minorsClient getById:@"1" onComplete:^(BOOL success, ODAMinor *minor) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"The first minor was last modified at: %@", minor.lastModified]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error getting first minor :-("];
            
        }
    }];

    [apiClient.minorsClient getList:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            // display the result
            [self appendLog:[NSString stringWithFormat:@"There are %d minors on the first page.", [list count]]];
        } else {
            // inform the user that an error happened
            [self appendLog:@"Error listing first page of minors :-("];
        }
    }];
    
    /**
     * COURSE RESULTS BY PERSON
     */
    [apiClient.courseResultsClient getCourseResultsByPerson:@"2" params:nil onComplete:^(BOOL success, NSArray *list) {
        
        if (success) {
            //display the result
            [self appendLog:[NSString stringWithFormat:@"The second person has %d course results.", [list count]]];
        } else {
            //inform the user that an error happened
            [self appendLog:@"Error getting course results of second person :-("];
        }
    }];
}


@end
