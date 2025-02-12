public class AccountUtils {
    public static List<Account> accountsByState(String str1){
        Account[] accList = [SELECT Name FROM Account WHERE BillingState = :str1];
        
        
        System.debug('Search Results: ');
        for(Account a : accList)
            System.debug(a.Name);
        
        return accList;
    }
}