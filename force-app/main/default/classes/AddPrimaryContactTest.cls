@isTest
public with sharing class AddPrimaryContactTest {
    public static final String STATE_ABREBATION = 'CA';
    @TestSetup
    static void makeData(){
        List<Account> lstAccount = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            if(i <= 50){
                lstAccount.add(new Account(BillingState='CA', Name='Test QA'+i));
            }else {
                lstAccount.add(new Account(BillingState='NY', Name='Test QA'+i));
            }
        }
        insert lstAccount;
        Contact contact = new Contact(
            FirstName = 'Queuable',
            LastName = 'Apex'
        );
        insert contact;
    }

    @IsTest
    static void addPrimaryContact(){
        Contact contact = [SELECT Id FROM Contact LIMIT 1];
        AddPrimaryContact apc = new AddPrimaryContact(contact,STATE_ABREBATION);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        //Get the records modified to assert 
        List<Account> lstAccount = [
            SELECT
                Id,
                (SELECT
                    Id,
                    Name,
                    LastName
                FROM Contacts)
            FROM Account
            WHERE 
                Name Like 'Test QA%' AND
                BillingState = :STATE_ABREBATION
        ];
        List<Contact> lstContact = new List<Contact>();
        for (Account account : lstAccount) {
            lstContact.add(account.Contacts);
        }
        System.assertEquals(50, lstContact.size());
    }
}