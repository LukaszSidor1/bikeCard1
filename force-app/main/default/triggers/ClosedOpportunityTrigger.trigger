trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	
    List<Task> tasksToCreate = new List<Task>();
    
    for (Opportunity opp : Trigger.new){
        if(opp.StageName == 'Closed Won'){
            tasksToCreate.add(new Task(
                Subject = 'Follow Up Test Task', 
            	WhatId = opp.id));
        }
    }
    
    insert tasksToCreate;
}