@isTest
public class AccountManagerTest {
    
    @TestSetup static void testSetup(){
        Account account = new Account();
        account.Name = 'prueba';
        insert account;
        
        Contact contact =  new Contact();
        contact.LastName = 'prueba';
        contact.AccountId = account.Id;
        insert contact;
    }
    
    @isTest public static void testGetAccount(){
        Account account = [Select Id,Name From Account Limit 1]; 
        RestRequest request = new RestRequest();
        request.requestURI = 'https://cunning-moose-tzubf0-dev-ed.lightning.force.com/services/apexrest/Accounts/'+account.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
    }
}