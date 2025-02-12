public class SomeTestingClass {
    public static void idTesting (){
        // Create the account sObject
        Account acct = new Account(Name='Acme', Phone='(415)555-1212', NumberOfEmployees=100);
        // Insert the account by using DML
        insert acct;
        // Get the new ID on the inserted sObject argument
        ID acctID = acct.Id;
        // Display this ID in the debug log
        System.debug('ID = ' + acctID);
        // Debug log result (the ID will be different in your case)
        // DEBUG|ID = 001D000000JmKkeIAF
    }
    //---------------------------------------------------------------------------
    public static void contactList (){
        // Create a list of contacts
        List<Contact> conList = new List<Contact> {
            new Contact(FirstName='Joe',LastName='Smith',Department='Finance'),
                new Contact(FirstName='Kathy',LastName='Smith',Department='Technology'),
                new Contact(FirstName='Caroline',LastName='Roth',Department='Finance'),
                new Contact(FirstName='Kim',LastName='Shain',Department='Education')};
        // Bulk insert all contacts with one DML call
        insert conList;
        // List to hold the new contacts to update
        List<Contact> listToUpdate = new List<Contact>();
        // Iterate through the list and add a title only
        //   if the department is Finance
        for(Contact con : conList) {
            if (con.Department == 'Finance') {
                con.Title = 'Financial analyst';
                // Add updated contact sObject to the list.
                listToUpdate.add(con);
            }
        }
        // Bulk update all contacts with one DML call
        update listToUpdate;
    }
    //---------------------------------------------------------------------------
    public static void upsertTest (){
        Contact jane = new Contact(FirstName='Jane',
                                 LastName='Smith',
                                 Email='jane.smith@example.com',
                                 Description='Contact of the day');
        insert jane;
        // 1. Upsert using an idLookup field
        // Create a second sObject variable.
        // This variable doesn’t have any ID set.
        Contact jane2 = new Contact(FirstName='Jane',
                                 LastName='Smith',
                                 Email='jane.smith@example.com',
                                 Description='Prefers to be contacted by email.');
        // Upsert the contact by using the idLookup field for matching.
        upsert jane2 Contact.fields.Email;
        // Verify that the contact has been updated
        System.assertEquals('Prefers to be contacted by email.',
                           [SELECT Description FROM Contact WHERE Id=:jane.Id].Description);
    }
    //---------------------------------------------------------------------------
    public static void insertTest(){
        Account acct = new Account(Name='SFDC Account');
        insert acct;
        // Once the account is inserted, the sObject will be
        // populated with an ID.
        // Get this ID.
        ID acctID = acct.ID;
        // Add a contact to this account.
        Contact mario = new Contact(
            FirstName='Mario',
            LastName='Ruiz',
            Phone='415.555.1212',
            AccountId=acctID);
        insert mario;
    }
    //---------------------------------------------------------------------------
    public static void soslTest(){
        String soslFindClause = 'Wingo OR SFDC';
        List<List<sObject>> searchList = [FIND :soslFindClause IN ALL FIELDS
                            RETURNING Account(Name),Contact(FirstName,LastName,Department)];
        Account[] searchAccounts = (Account[])searchList[0];
        Contact[] searchContacts = (Contact[])searchList[1];
        System.debug('Found the following accounts.');
        for (Account a : searchAccounts) {
            System.debug(a.Name);
        }
        System.debug('Found the following contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}