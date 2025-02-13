public class Test2 {
    public static void soqlTest(){
        // Add account and related contact
    Account acct = new Account(
        Name='SFDC Computing',
        Phone='(415)555-1212',
        NumberOfEmployees=50,
        BillingCity='San Francisco');
    insert acct;
    // Once the account is inserted, the sObject will be
    // populated with an ID.
    // Get this ID.
    ID acctID = acct.ID;
    // Add a contact to this account.
    Contact con = new Contact(
        FirstName='Carol',
        LastName='Ruiz',
        Phone='(415)555-1212',
        Department='Wingo',
        AccountId=acctID);
    insert con;
    // Add account with no contact
    Account acct2 = new Account(
        Name='The SFDC Query Man',
        Phone='(310)555-1213',
        NumberOfEmployees=50,
        BillingCity='Los Angeles',
        Description='Expert in wing technologies.');
    insert acct2;
    }
    public static void viewContacts() {
        List<Contact> listofContacts = [SELECT Firstname, LastName FROM contact];
        
        for (Contact con : listofContacts){
            String fullName = 'First Name: ' + con.FirstName + ', Last Name: ' + con.LastName;
            system.debug(fullName);
        }
        
    }
    
    
    
    
    
    
    
}