@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock {
	//implement interface method
    global HTTPResponse respond(HTTPRequest request){
        //create fake response
        HttpResponse response = new HttpResponse();
      	response.setHeader('Content-Type', 'application/json;chartset');
        response.setBody('{"animals":["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        response.setStatusCode(200);
        return response;
    }
}