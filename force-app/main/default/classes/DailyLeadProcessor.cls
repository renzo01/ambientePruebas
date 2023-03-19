/**
 * @description       : implementation of schedules
 * @author            : Renzo Manuel Gomez Cesare
 * @group             : 
 * @last modified on  : 10-31-2022
 * @last modified by  : Renzo Manuel Gomez Cesare
**/
public with sharing class DailyLeadProcessor implements Schedulable {
    public static final String LEAD_SOURCE = 'Dreamforce';
    /**
    * @description Execute the schedules
    * @author Renzo Manuel Gomez Cesare | 10-31-2022 
    * @param context 
    **/
    public static void execute(SchedulableContext context) {
        List<Lead> lstLead = [
            SELECT
                Id,
                LeadSource
            FROM Lead
            WHERE
                LeadSource = ''
            LIMIT 200
        ];
        for (Lead lead : lstLead) {
            lead.LeadSource = LEAD_SOURCE;
        }
        upsert lstLead;
    }
}