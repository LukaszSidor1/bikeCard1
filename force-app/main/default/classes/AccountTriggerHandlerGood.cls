public without sharing class AccountTriggerHandlerGood {

    // Before Trigger Methods
    public static void beforeInsert(Map<Id,Account> newMap){
        // Add logic here for after insert operations
        System.debug('beforeInsert method called with accounts: ' + newMap);
    }

    // This method is called before the records are inserted
    public static void beforeUpdate(Map<Id, Account> newAccounts, Map<Id, Account> oldAccountMap) {

        // // Check if the RunValidationRules__c custom setting is enabled
        // RunValidationRules__c runVal = RunValidationRules__c.getInstance();
        // if(runVal.Run_Validation__c){
        //     for(Account acc : newAccounts.values()){
        //         acc.addError('You cannot update this record');
        //     }
        // }

        // // Update the AccountShare records for the new Accounts
        // if (Schema.sObjectType.AccountShare.isAccessible() && Schema.sObjectType.AccountShare.isUpdateable()) {

        //     // Get the AccountShare records for the old Accounts
        //     List<AccountShare> shares = [
        //         SELECT Id, AccountAccessLevel, AccountId, CaseAccessLevel, ContactAccessLevel, OpportunityAccessLevel, RowCause, UserOrGroupId 
        //         FROM AccountShare 
        //         WHERE AccountId IN :oldAccountMap.keySet() AND RowCause = 'Manual'
        //     ];

        //     // Create a map of the AccountShare records
        //     Map<Id, AccountShare> shareMap = new Map<Id, AccountShare>(shares);

        //     // Update the AccountShare records for the new Accounts
        //     for (Account acc : newAccounts.values()) {
        //         AccountShare share = shareMap.get(acc.Id);
        //         if (share != null) {
        //             share.AccountAccessLevel = 'Edit';
        //         } else {
        //             share = new AccountShare();
        //             share.AccountAccessLevel = 'Edit';
        //             share.AccountId = acc.Id;
        //             share.UserOrGroupId = UserInfo.getUserId();
        //             share.RowCause = Schema.AccountShare.RowCause.Manual;
        //             shareMap.put(share.Id, share);
        //         }
        //     }
        //     update shareMap.values();
        //     insert shareMap.values();
        // }
    }

    public static void beforeDelete(Map<Id,Account> oldMap, List<Account> triggerOld){
        
        System.debug('beforeDelete method called with accounts: ' + oldMap);

        // If Account has related Opportunities, throw fatal error
        if (Schema.sObjectType.Account.isAccessible()) {

            // Check if the Account has related Opportunities
            for (Account a : [SELECT Id 
                            FROM Account
                            WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :triggerOld]) {
                oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
            }
        } else {

            // Handle the case where the user does not have read access to Account
            System.debug('User does not have read access to Account');
        }
    }

    // After Trigger Methods
    public static void afterInsert(List<Account> newList){
        System.debug('afterInsert method called with accounts: ' + newList);

        // Call the afterInsert method
        AddRelatedRecord.addOppWhenNone(newList);
    }
    
    public static void afterUpdate(List<Account> newList){
        System.debug('afterUpdate method called with accounts: ' + newList);

        // Call the afterUpdate method
        AddRelatedRecord.addOppWhenNone(newList);
    }

    public static void afterDelete(Map<Id,Account> oldMap){
        // Add logic here for after insert operations
        System.debug('afterDelete method called with accounts: ' + oldMap);
    }

    public static void afterUndelete(Map<Id,Account> newMap){
        // Add logic here for after insert operations
        System.debug('afterUndelete method called with accounts: ' + newMap);
    }
    

    

}