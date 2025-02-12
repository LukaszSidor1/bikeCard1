trigger AccountAddressTrigger on Account (before insert, before update) {
    
    // Check if user has necessary permissions
    if (
        !Schema.sObjectType.Account.isAccessible() ||
        !Schema.sObjectType.Account.isUpdateable() ||
        !Schema.sObjectType.Account.fields.BillingPostalCode.isAccessible() ||
        !Schema.sObjectType.Account.fields.ShippingPostalCode.isUpdateable()
    ) {
        System.debug('User does not have necessary permissions');
        return;
    }

    // Check if the Match Billing Address checkbox is checked
    for (Account account : Trigger.new) {
        if (account.Match_Billing_Address__c) {
            account.ShippingPostalCode = account.BillingPostalCode;
        }
    }
}