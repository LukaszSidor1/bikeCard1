public class ContactSearch {
    public static List<Contact> searchForContacts(String str1, String str2){
        Contact[] cts = [SELECT name 
                         FROM Contact 
                         WHERE LastName = :str1 AND MailingPostalCode = :str2];
        
        
        return cts;
    }
}