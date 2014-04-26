//
//  ODAViewController.m
//  OpenOnderwijsAPI-objc
//
//  Created by Ivo Jansch on 30/03/14.
//  Copyright (c) 2014 surfnet. All rights reserved.
//

#import "ViewController.h"
#import <OpenOnderwijsAPI/OpenOnderwijsAPI.h>

#define BASE_URL @"http://localhost:8000"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = @"";
    
    // Create a new client for our API
    ODAClient *apiClient = [[ODAClient alloc] initWithBaseURL:BASE_URL];
    [self testAllApis: apiClient];

}

- (void)appendLog:(NSString *)logEntry {
    self.textView.text = [NSString stringWithFormat:@"%@%@\n", self.textView.text, logEntry];
}

- (void)testAllApis:(ODAClient *)apiClient {
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
     */ /*
    final TextView firstNewsFeed = (TextView)findViewById(R.id.firstNewsFeed);
    final TextView numberOfNewsFeeds = (TextView)findViewById(R.id.numberOfNewsFeeds);
    // get the info about the first newsfeed
    apiClient.getNewsFeedsClient().getById("1", null, new EntityHandler<NewsFeed>() {
        
        @Override
        public void success(NewsFeed newsFeed) {
            // display the result
            firstNewsFeed.setText("The first news feed has " + newsFeed.getItems().size() + " items.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user about the error.
            firstNewsFeed.setText("Error getting info about the first newsfeed :-(");
            e.printStackTrace();
        }
    });
    // get the number of the newsfeeds on the first page
    apiClient.getNewsFeedsClient().getList(new Params().setPage(1), new ListHandler<NewsFeed>() {
        
        @Override
        public void success(List<NewsFeed> list) {
            // display the result
            numberOfNewsFeeds.setText("There are " + list.size() + " newsfeeds on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user about the error
            numberOfNewsFeeds.setText("Error listing the first page of the newsfeeds :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * GROUP ROLES
     */ /*
    final TextView firstRoleName = (TextView)findViewById(R.id.firstRoleName);
    final TextView numberOfRoles = (TextView)findViewById(R.id.numberOfRoles);
    // get the info about the first news item
    apiClient.getGroupRolesClient().getById("1", null, new EntityHandler<GroupRole>() {
        
        @Override
        public void success(GroupRole groupRole) {
            // display the result
            firstRoleName.setText("The first role's name is: '" + groupRole.getRole() + "'.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user about the error.
            firstRoleName.setText("Error getting info about the first group role :-(");
            e.printStackTrace();
        }
    });
    // get the number of group roles on the first page
    apiClient.getGroupRolesClient().getList(new Params().setPage(1), new ListHandler<GroupRole>() {
        
        @Override
        public void success(List<GroupRole> list) {
            // display the result
            numberOfRoles.setText("There are " + list.size() + " group roles on the first page.");
            // GET PERSON BY URL
        
            _getPersonByURL(apiClient, list);
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user about the error
            numberOfRoles.setText("Error listing the first page of the group roles :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * COURSES
     */ /*
    final TextView firstCourse = (TextView)findViewById(R.id.firstCourse);
    final TextView numberOfCourses = (TextView)findViewById(R.id.numberOfCourses);
    apiClient.getCoursesClient().getById("1", null, new EntityHandler<Course>() {
        
        @Override
        public void success(Course course) {
            // display the result
            firstCourse.setText("The first course has " + course.getLessonUrls().size() + " lessons.");
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            firstCourse.setText("Error getting first course :-(");
            error.printStackTrace();
        }
    });
    apiClient.getCoursesClient().getList(new Params().setPage(1), new ListHandler<Course>() {
        
        @Override
        public void success(List<Course> list) {
            // display the result
            numberOfCourses.setText("There are " + list.size() + " courses on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            numberOfCourses.setText("Error listing first page of courses :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * LESSONS
     */ /*
    final TextView firstLesson = (TextView)findViewById(R.id.firstLesson);
    final TextView numberOfLessons = (TextView)findViewById(R.id.numberOfLessons);
    apiClient.getScheduleClient().getById("1", null, new EntityHandler<Lesson>() {
        
        @Override
        public void success(Lesson lesson) {
            // display the result
            firstLesson.setText("The first lesson starts at: " + lesson.getStartDate());
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            firstLesson.setText("Error getting first lesson :-(");
            error.printStackTrace();
        }
    });
    apiClient.getScheduleClient().getList(new Params().setPage(1), new ListHandler<Lesson>() {
        
        @Override
        public void success(List<Lesson> list) {
            // display the result
            numberOfLessons.setText("There are " + list.size() + " lessons on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            numberOfLessons.setText("Error listing first page of lessons :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * SCHEDULE OF A PERSON
     */ /*
    final TextView schedulePerson = (TextView)findViewById(R.id.schedulePerson);
    Params scheduleParams = new Params();
    try {
        scheduleParams.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse("1996-01-01"));
    } catch (ParseException e) {
        // no start date then (default is today 00:00)
    }
    scheduleParams.setEndDate(new Date());
    apiClient.getScheduleClient().getScheduleByPerson("1", scheduleParams, new ListHandler<Lesson>() {
        
        @Override
        public void success(List<Lesson> list) {
            // display the result
            schedulePerson.setText("The first person has " + list.size() + " lessons.");
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            schedulePerson.setText("Error getting the schedule of the first person.");
            error.printStackTrace();
        }
    });
    
    /**
     * COURSE RESULTS
     */ /*
    final TextView firstCourseResult = (TextView)findViewById(R.id.firstCourseResult);
    final TextView numberOfCourseResults = (TextView)findViewById(R.id.numberOfCourseResults);
    apiClient.getCourseResultsClient().getById("1", null, new EntityHandler<CourseResult>() {
        
        @Override
        public void success(CourseResult courseResult) {
            // display the result
            firstCourseResult.setText("The first course result's grade is: " + courseResult.getGrade());
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            firstCourseResult.setText("Error getting first course result :-(");
            error.printStackTrace();
        }
    });
    apiClient.getCourseResultsClient().getList(new Params().setPage(1), new ListHandler<CourseResult>() {
        
        @Override
        public void success(List<CourseResult> list) {
            // display the result
            numberOfCourseResults.setText("There are " + list.size() + " course results on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            numberOfCourseResults.setText("Error listing first page of course results :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * TEST RESULTS
     */ /*
    final TextView firstTestResult = (TextView)findViewById(R.id.firstTestResult);
    final TextView numberOfTestResults = (TextView)findViewById(R.id.numberOfTestResults);
    apiClient.getTestResultsClient().getById("1", null, new EntityHandler<TestResult>() {
        
        @Override
        public void success(TestResult testResult) {
            // display the result
            firstTestResult.setText("The first test result's date is: " + testResult.getDate().toString());
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            firstTestResult.setText("Error getting first test result :-(");
            error.printStackTrace();
        }
    });
    apiClient.getTestResultsClient().getList(new Params().setPage(1), new ListHandler<TestResult>() {
        
        @Override
        public void success(List<TestResult> list) {
            // display the result
            numberOfTestResults.setText("There are " + list.size() + " test results on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            numberOfTestResults.setText("Error listing first page of test results :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * MINORS
     */ /*
    final TextView firstMinor = (TextView)findViewById(R.id.firstMinor);
    final TextView numberOfMinors = (TextView)findViewById(R.id.numberOfMinors);
    apiClient.getMinorsClient().getById("1", null, new EntityHandler<Minor>() {
        
        @Override
        public void success(Minor minor) {
            // display the result
            firstMinor.setText("The first minor was last modificated at: " + minor.getLastModified());
        }
        
        @Override
        public void failure(NetworkError error) {
            // inform the user that an error happened
            firstMinor.setText("Error getting first minor :-(");
            error.printStackTrace();
        }
    });
    apiClient.getMinorsClient().getList(new Params().setPage(1), new ListHandler<Minor>() {
        
        @Override
        public void success(List<Minor> list) {
            // display the result
            numberOfMinors.setText("There are " + list.size() + " minors on the first page.");
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            numberOfMinors.setText("Error listing first page of minors :-(");
            e.printStackTrace();
        }
    });
    
    /**
     * COURSE RESULTS BY PERSON
     */ /*
    final TextView courseResultsByPerson = (TextView)findViewById(R.id.courseResultsByPerson);
    apiClient.getCourseResultsClient().getCourseResultsByPerson("2", null, new ListHandler<CourseResult>() {
        
        @Override
        public void success(List<CourseResult> list) {
            //display the result
            courseResultsByPerson.setText("The second person has " + list.size() + " course results.");
        }
        
        @Override
        public void failure(NetworkError error) {
            //inform the user that an error happened
            courseResultsByPerson.setText("Error getting course results of second person :-(");
        }
    });
}

protected void _getPersonByURL(OnderwijsDataAPI apiClient, List<GroupRole> list) {
    // can't do this without the roles
    if (list == null || list.size() == 0) {
        
        return;
    }
    GroupRole firstRole = list.get(0);
    String personUrl = firstRole.getPersonUrl();
    final TextView personByUrl = (TextView)findViewById(R.id.personByUrl);
    apiClient.getPersonsClient().get(personUrl, null, new EntityHandler<Person>() {
        
        @Override
        public void success(Person person) {
            // display the result
            personByUrl.setText("The person linked from the first role is named: " + person.getDisplayName());
        }
        
        @Override
        public void failure(NetworkError e) {
            // inform the user that an error happened
            personByUrl.setText("Couldn't get person linked from first role :-(");
            e.printStackTrace();
        }
    });
}

private void _setupLoginButton(final OnderwijsDataAPI api) {
    Button loginButton = (Button) findViewById(R.id.loginButton);
    loginButton.setOnClickListener(new OnClickListener() {
        
        @Override
        public void onClick(View v) {
            // change the credentials in your own app.
            api.getOAuthHandler().login("admin", "admin", new LoginHandler() {
                
                @Override
                public void success() {
                    Toast.makeText(MainActivity.this, "Successful login", Toast.LENGTH_LONG).show();
                    System.out.println(api.getOAuthHandler().getTokenData().getAccessToken());
                    _testAllApis(api);
                }
                
                @Override
                public void failure(String message) {
                    Toast.makeText(MainActivity.this, "Login error: " + message, Toast.LENGTH_LONG).show();
                }
            });
        }
    }); */
}


@end
