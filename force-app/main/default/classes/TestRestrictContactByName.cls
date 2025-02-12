@isTest
private class TestRestrictContactByName {

    @isTest
    static void myUnitTest() {
        // Test data
        List<Contact> contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'Test', LastName = 'User'));
        contacts.add(new Contact(FirstName = 'Test', LastName = 'INVALIDNAME'));

        Test.startTest();
        Database.SaveResult[] results = Database.insert(contacts, false);
        Test.stopTest();

        // Query for contacts
        List<Contact> contact1 = [SELECT Id, FirstName, LastName FROM Contact WHERE LastName = 'User'];
        List<Contact> contact2 = [SELECT Id, FirstName, LastName FROM Contact WHERE LastName = 'INVALIDNAME'];

        System.assertEquals(1, contact1.size(), 'something went wrong');
        System.assertEquals(0, contact2.size(), 'something went wrong');
    }
}