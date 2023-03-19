@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result = [Select Id, Name, (SELECT Id, Name FROM Contacts)  from Account where Id =:accountId Limit 1];
        return result;
    }
}