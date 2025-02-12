public with sharing class AccountTriggerHandler {
    public static void CreateAccounts (List<Account> accountsIn){
        
        List<Account> accUpdated = new List<Account>();
        
        for(Account acc : accountsIn){
            acc.ShippingState = acc.BillingState;
            accUpdated.add(acc);
        }
    }
}