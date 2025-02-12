@isTest
public class AddPrimaryContactTest {
	
    @isTest
    private static void testQueueableClass(){
        
        // load test data
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 500; i++){
            Account acc = new Account(Name = 'Test' + i, BillingState = 'CA');
           accounts.add(acc);
        }
        insert accounts;
        
        Contact contact = new Contact(FirstName = 'test', LastName = 'name');
        insert contact;
        
        Test.startTest();
        
        Id JobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        
        Test.stopTest();
        
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contacts.size(), 'error in batch');
              
    }
}