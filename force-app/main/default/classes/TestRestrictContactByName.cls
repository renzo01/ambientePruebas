@isTest
public with sharing class TestRestrictContactByName {
    @IsTest
    static void TestRestrictContactByName(){
        Contact newContact =  new Contact(LastName='INVALIDNAME');
        insert newContact;
        Test.startTest();
        Database.SaveResult result = Database.insert(newContact, false);
        Test.stopTest();
        system.assert(!result.isSuccess());
        system.assert(result.getErrors().size() > 0);
    }
}