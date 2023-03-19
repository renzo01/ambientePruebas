trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    for(Opportunity opp : [
        SELECT 
            Id, 
            StageName, 
            (
                SELECT 
                    Id, 
                    Subject
                FROM Tasks 
            )
        From Opportunity 
        WHERE 
            Id IN : Trigger.new AND
            StageName = 'Closed Won'
        WITH SECURITY_ENFORCED
    ]){
        tasks.add(
            new Task(
                WhatId = opp.Id,
                Subject = 'Follow up Test Task '
            )
        );
    }
    if(tasks.size() > 0){
        if(Schema.SObjectType.Task.isCreateable()){
            insert tasks;
        }
    }
}