public with sharing class AccountSearchController {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchTerm) {

        String query = 'SELECT Id, Name FROM Account';
        String whereClause = 'Name like \'%'+searchTerm+'%\' ';
        List<Account> res = database.query(query+' where '+whereClause);
        
        // database.query('SELECT Id, Name FROM Account WHERE Name LIKE '+ '\'%' + sanitizedSearchTerm + '%\'');
        // SELECT id, name FROM Account WHERE Name LIKE '%test%'

        return res;
    }
}