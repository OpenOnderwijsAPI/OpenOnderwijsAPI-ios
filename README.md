OpenOnderwijsAPI-ios
====================

This is the OpenOnderwijsAPI client for iOS apps.

Setup
-----
To use the client in your own app:

* Simply drag the OpenOnderwijsAPI.framework (from Library/OpenOnderwijsAPI-objc/Products) to the frameworks section of your app in Xcode.
* Add the following import statement to your app's code:

    #import <OpenOnderwijsAPI/OpenOnderwijsAPI.h>

* Initialize the API like this, where BASE_URL is the full url of your API.

    ODAClient *apiClient = [[ODAClient alloc] initWithBaseURL:BASE_URL];

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

Demo
----
A simple demo application is privided in the Demo folder, which calls a number of methods on the API and demonstrates how to work with OAuth2.

If you want to try out OAuth2 support using the demo app and the reference python implementation, follow these steps:

* Go to http://localhost:8000/admin and login using the Django superuser.
* Edit the Oauth clients and create a client. The URLS don't matter (they are required, but not relevant, just enter http://example.com).
* Note the consumer key/secret and change these in the ViewController.m file
