public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT name, AnnualRevenue FROM Account];
        
        for (Account acc : accountsList){
            String acctRev = acc.name + ' : ' + acc.AnnualRevenue;
            system.debug(acctRev);
            
        }
        
    }
}