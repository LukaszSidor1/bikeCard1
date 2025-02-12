@isTest
private class LeadProcessorTest {
	
    @isTest
    private static void testBatchClass(){
        
        //Load data
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName = 'Test', Company = 'Salesforce'));
        }
        insert leads;
        
        // do the test
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();
        
        
        //check result
        List<Lead> afterChangeLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, afterChangeLeads.size(), 'error');
    }
    
}