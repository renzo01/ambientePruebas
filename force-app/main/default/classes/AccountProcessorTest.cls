/**
 * @description       : Test the class AccountProcessor
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
@isTest
public with sharing class AccountProcessorTest {
    @TestSetup
    static void makeData(){
     //insert an account        
     Account account = New Account(Name='Account Number 1');
     insert account;
     
     //Create a list of contacts
     List<Contact> contacts = new List<Contact>();
     contacts.add(New Contact(Lastname='Releted Contact 1',AccountId=account.Id));
     contacts.add(New Contact(Lastname='Releted Contact 2',AccountId=account.Id));
     contacts.add(New Contact(Lastname='Releted Contact 3',AccountId=account.Id));
     contacts.add(New Contact(Lastname='Releted Contact 4',AccountId=account.Id));
     insert contacts;

    }
    @isTest
    public static void countContactsTest(){
        Account acc = [SELECT Id,Number_Of_Contacts__c FROM Account LIMIT 1];
        Set<Id> accountIds = new Set<Id>();
        accountIds.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        System.assertEquals(4, Integer.valueOf(acc.Number_Of_Contacts__c));
    }
}