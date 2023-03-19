/**
 * @description       : 
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-29-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
public with sharing class LeadProcessor implements Database.Batchable<SObject> {
    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-29-2022 
    * @param bc 
    * @return Database.QueryLocator 
    **/
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT '+
                'Id,'+
                'LeadSource '+
            'FROM Lead'
        );
    }
    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-29-2022 
    * @param bc 
    * @param allLeads 
    * @return Database.QueryLocator 
    **/
    public void execute(Database.BatchableContext bc, List<Lead> allLeads ){
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead lead : allLeads) {
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }
        update leadsToUpdate;
    }
    /**
    * @description 
    * @author Renzo Manuel Gomez Cesare | 10-29-2022 
    * @param bc 
    * @return Database.QueryLocator 
    **/
    public void finish(Database.BatchableContext bc){
        
    }
}