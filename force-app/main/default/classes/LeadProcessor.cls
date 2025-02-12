public without sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    public Integer recordCount = 0;
    
    public Database.QueryLocator start( Database.BatchableContext dbc){
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    
    
    // leads can have up to 200 records
    public void execute(Database.BatchableContext dbc, List<Lead> leads){
        for (Lead l : leads){
            l.LeadSource = 'Dreamforce';
            recordCount += 1;
        }
        
        update leads;
    }
    
    public void finish(Database.BatchableContext dbc){
        System.debug('Batch finished with: ' + recordCount);
    }
        

}