OpenOnderwijsAPI-ios
====================

This is the OpenOnderwijsAPI client for iOS apps.

Setup
-----
To use the client in your own app:

* Simply drag the OpenOnderwijsAPI.framework (from Library/OpenOnderwijsAPI-objc/Products) to the frameworks section of your app in Xcode.
* Add the following import statement to your app's code:

    ```#import <OpenOnderwijsAPI/OpenOnderwijsAPI.h>```

* Initialize the API like this, where BASE_URL is the full url of your API.

    ```ODAClient *apiClient = [[ODAClient alloc] initWithBaseURL:BASE_URL];```

That's it, you should now be able to call the api.

Calling the API
---------------

Methods are asynchronous. Completion handlers are used to process the data from the api.

In general, most clients (persons, courses, testresults etc.) follow the same structure. You can retrieve individual items:

    [apiClient.personsClient getById:@"1" onComplete:^(BOOL success, ODAPerson *person) {
        
        if (success) {
            // display the name of the first person
            [self appendLog:[NSString stringWithFormat:@"The first person is called: %@", person.displayName]];
        } else {
            [self appendLog:@"Error in getting first person :-("];
        }
    }];
    
Or lists of data:

    // create a params object, and set the page to 1, also search to persons with the name 'Bibber'
    ODAParameters *listParams = [[ODAParameters alloc] init];
    listParams.page = 1;
    listParams.searchQuery = @"bibber";
    
    // get the list of the persons on the first page
    [apiClient.personsClient getList:listParams onComplete:^(BOOL success, NSArray *personList) {
     
        if (success) {
            [self appendLog:[NSString stringWithFormat:@"There are %d persons on the first page named 'bigger'.", [personList count]]];
        } else {
            [self appendLog:@"Error in listing persons of first page :-("];
        }
    }];


The success variable indicates whether the call was succesful. If NO, the person object will be invalid.

To find out if the API sent an error message, you can inspect apiClient.personsClient.lastError, which will be the raw dictionary that the API returned.

For a list of available clients see the ODAClient.h header file.

A word on semi-populated objects
--------------------------------
Note that related objects in the API may not be fully populated after a call.

For example, if you retrieve a person's schedule, some details will be included on the room (name and description) but the API does NOT return 'fat objects', so the room object will not be fully populated.

If you want to display the room details, you can use the RoomsClient to retrieve the full room, passing in the id that you got in the partial object.

    [apiClient.roomsClient getById:lesson.room.identifier onComplete:.....]

Working with OAuth2
-------------------
The library can work with OAuth2. It does not make any assumptions on your OAuth implementation, other than the fact that it uses the accessToken to call the api.

The demo application contains a working OAuth sample that can serve as reference for OAuth2 setup. Regardless of what Oauth implementation you use, if you need to authorize a call using an access token, you can do so like this:

    apiClient.personsClient.accessToken = @"youraccesstoken";
    [apiClient.personsClient getMeOnComplete:^(BOOL success, ODAPerson *person) {
        
        if (success) {
            // display the name of the first person
            [self appendLog:[NSString stringWithFormat:@"My name is: %@", person.displayName]];
        } else {
            [self appendLog:[NSString stringWithFormat:@"Error in getting personal data :-( (reason: %@)", apiClient.personsClient.lastError]];
        }
    }];
    apiClient.personsClient.accessToken = nil;

Reset the token to nil after the call if you don't want to authorize all calls of the client.

Demo
----
A simple demo application is privided in the Demo folder, which calls a number of methods on the API and demonstrates how to work with OAuth2.

To setup the demo:

* Run 'pod install' inside the repository root (where the Podfile is located). This installs dependencies that the demo uses using cocoapods.
* Open the OpenOnderwijsAPI-demo.xcworkspace workspace in Xcode
* Run the demo.

If you want to try out OAuth2 support using the demo app and the reference python implementation, follow these steps:

* Go to http://localhost:8000/admin and login using the Django superuser.
* Edit the Oauth clients and create a client. The URLS don't matter (they are required, but not relevant, just enter http://example.com).
* Note the consumer key/secret and change these in the ViewController.m file
