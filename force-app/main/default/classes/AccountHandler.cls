public class AccountHandler {
    public static Account insertNewAccount(String accName){
        

        	Account queriedAccount = new Account(Name = accName);

        try{
            
            insert queriedAccount;
            return queriedAccount;
            
        } catch (DmlException e){
            
            return null;
            
        }
        
    }
}