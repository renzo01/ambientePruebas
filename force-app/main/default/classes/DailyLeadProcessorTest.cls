/**
 * @description       : Test class for AddPrimaryContact
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
@IsTest
public with sharing class DailyLeadProcessorTest {
    public static final String LEAD_COMPANY = 'RMG';
    public static final String LEAD_SOURCE = 'Dreamforce';
    public static final String CRON_EXP = '0 35 12 1/1 * ? *';
    /**
    * @description Register Leads for test
    * @author Renzo Manuel Gomez Cesare | 10-31-2022 
    **/
    @TestSetup
    static void makeData(){
        List<Lead> lstLead = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            lstLead.add(new Lead(Company = LEAD_COMPANY, LeadSource = '', LastName= LEAD_COMPANY));
        }
        insert lstLead;
    }
    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-31-2022 
    **/
    @IsTest
    static void addPrimaryContact(){
        Test.startTest();
        System.schedule('SchedulePractice', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        List<Lead> lstLead = [SELECT Id FROM LEAD WHERE LeadSource = :LEAD_SOURCE];
        System.assertEquals(200, lstLead.size());
    }
}