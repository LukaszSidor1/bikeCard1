@isTest
public class DailyLeadProcessorTest {
    
    private static String CRON_EXP = '0 0 0 ? * * *';

    @isTest
    private static void testSchedulableClass(){
        
        List<Lead> leads = new List<Lead>();
        
        for (Integer i = 0; i < 200; i++){
            Lead l = new Lead(LastName = 'Test', Company = 'SF');
            leads.add(l);
        }
        
        insert leads;
        
        Test.startTest();
        
        String jobId = System.schedule('Process Leads', CRON_EXP, new DailyLeadProcessor());
        
        Test.stopTest();
        
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Error');
        
        List<CronTrigger> cts = 
            [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.debug('Next fire: ' + cts[0].NextFireTime);
    }
}