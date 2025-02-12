public with sharing class AddRelatedRecord {

    // After Trigger Methods
    public static void addOppWhenNone(List<Account> newList){

        // Create a list to hold the opportunities to insert
        List<Opportunity> oppList = new List<Opportunity>();

        // Get the related opportunities for the accounts in this trigger
        Map<Id,Account> acctsWithOpps = new Map<Id,Account>( [
            SELECT Id,(SELECT Id FROM Opportunities) 
            FROM Account 
            WHERE Id IN :Trigger.new] );

        // Add an opportunity for each account if it doesn't already have one.
        // Iterate through each account.
        for(Account a : newList) {

            // Debug the size of the opportunities list for the account
            System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());

            // Check if the account already has a related opportunity.
            if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {

                // If it doesn't, add a default opportunity
                oppList.add(new Opportunity(Name = a.Name + ' Opportunity',
                                            StageName = 'Prospecting',
                                            CloseDate = System.today().addMonths(1),
                                            AccountId = a.Id));
            }
        }

        // Insert the list of opportunities
        if (oppList.size() > 0) {
            if (Schema.sObjectType.Opportunity.isCreateable()) {
                insert oppList;
            } else {
                System.debug('User does not have permission to create Opportunity records.');
            }
        }
    }
}