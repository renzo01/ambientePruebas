@isTest
public with sharing class TestVerifyDate {
    @IsTest
    static void testCheckDate(){
        Date dateResult = null;
        Date date1 = Date.newInstance(2018, 1, 1);
        Date date2 = Date.newInstance(2018, 1, 2);
        Test.startTest();
            dateResult = VerifyDate.CheckDates(date1, date2);
        Test.stopTest();
        system.assertEquals(true, (dateResult <> null), 'Date is null');
    }

    @IsTest
    static void testCheckDate2(){
        Date dateResult = null;
        Date date1 = Date.newInstance(2018, 1, 3);
        Date date2 = Date.newInstance(2018, 1, 2);
        Test.startTest();
            dateResult = VerifyDate.CheckDates(date1, date2);
        Test.stopTest();
        system.assertEquals(true, (dateResult <> null), 'Date is null');
    }
}