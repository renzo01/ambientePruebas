/**
 * @description       : 
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-29-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
@isTest
public with sharing class LeadProcessorTest {
    private static final String LEAD_NAME = 'New Lead';
    private static final String LEAD_COMPANY = 'RMG';
    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-29-2022 
    **/
    @TestSetup
    static void makeData(){
        List<lead> lstLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead();
            lead.LastName = LEAD_NAME;
            lead.Company = LEAD_COMPANY;
            lstLeads.add(lead);
        }
        insert lstLeads;
    }

    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-29-2022 
    **/
    @isTest
    public static void testLeads(){
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp,200);
        Test.stopTest();
        List<Lead> updateLeads = [SELECT Id FROM Lead Where LeadSource='Dreamforce'];
        System.assertEquals(200, updateLeads.size());
    }
}