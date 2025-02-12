@isTest
private class AccountProcessorTest {
    
	@isTest
    private static void countContactsTest(){
        
        //Load Test Data
        List<Account> accs = new List<Account>();
        
        
        for (Integer i = 0; i < 300; i++){
            accs.add(new Account(Name = 'Test' + i));
        }
        
        insert accs;
        
        List<Contact> contacts = new List<Contact>();
        List<Id> accIds = new List<Id>();
        
        for(Account acc : accs){
            contacts.add(new Contact(FirstName = acc.Name, LastName = 'TestContact', AccountId = acc.Id));
            accIds.add(acc.Id);
        }
        
        insert contacts;
                  
        // Do the test
        Test.startTest();
        
        AccountProcessor.countContacts(accIds);
        
        Test.stopTest();
        
        
        // Check result
        
        List<Account> accsCheck = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for (Account accCheck : accsCheck){
            System.assertEquals(1, accCheck.Number_Of_Contacts__c, 
                                'ERROR: AccountProcessor.countContacts not working');
        }
        
        
        
        
        
    }
}