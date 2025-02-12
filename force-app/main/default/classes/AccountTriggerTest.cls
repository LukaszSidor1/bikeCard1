@isTest
public class AccountTriggerTest {
    @isTest 
    static void TestUpdateAccountsInBulk(){
        List<Account> accs = new List<Account>();
        
        for (Integer i = 0; i < 200; i++){
            Account acct = new Account(Name = 'Test' + i, BillingState = 'CA');
            accs.add(acct);
        }
        
        
        Test.startTest();
        insert accs;
        Test.stopTest();
        
        List<Account> verifyingAcc = [SELECT Id FROM Account WHERE id IN:accs];
        System.assertEquals(200, verifyingAcc.size());
        for (Account acc : verifyingAcc){
            System.assertEquals('CA', acc.ShippingState);
        }
    }
}