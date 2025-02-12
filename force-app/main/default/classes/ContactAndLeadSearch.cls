public class ContactAndLeadSearch {
    public static List<List< sObject>> searchContactsAndLeads(String str1){
        List<List<sObject>> searchList = [FIND :str1 IN NAME FIELDS
                            RETURNING Lead,Contact];
        
        return searchList;
    }
    
}