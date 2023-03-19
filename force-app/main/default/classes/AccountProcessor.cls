/**
 * @description       : Make a class to update Account
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
public with sharing class AccountProcessor {
    /**
    * @description update count of contacts related to one Account
    * @author Renzo Manuel Gomez Cesare | 10-26-2022 
    * @param accountIds List of Ids where is releted to Account
    **/
    @future
    public static void countContacts(Set<Id> accountIds){
        /**
         * Task:
            Name: AccountProcessor
            Method name: countContacts
            The method must accept a List of Account IDs
            The method must use the @future annotation
            The method counts the number of Contact records associated to each Account ID passed to the method and updates the 'Number_Of_Contacts__c' field with this value
         */
        List<Account> accountData = [
            SELECT 
                Id, 
                Number_Of_Contacts__c,
                (SELECT Id FROM Contacts) 
            FROM Account 
            Where 
                Id In :accountIds
        ];
        for (Account acc : accountData) {
            acc.Number_Of_Contacts__c = acc.contacts.size();
        }
        update accountData;
    }
}