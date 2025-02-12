@isTest
private class TestVerifyDate {

@isTest
    private static void CheckDates() {
        // Create test date pairs
        Date date1 = Date.newInstance(2025, 01, 01);
        Date date2 = date1.addDays(10);
        Date date3 = date1.addDays(32);
        Date date4 = date3.addDays(50);
        
        
        
        Test.startTest();
        Date check1 = VerifyDate.CheckDates(date1, date2); // Expected 11th January 2025
        Date check2 = VerifyDate.CheckDates(date1, date3); // Expected 31st January 2025
        Date check3 = VerifyDate.CheckDates(date1, date4); // Expected 31st January 2025
        Date check4 = VerifyDate.CheckDates(date1, date1); // Expected 1st January 2025
        Test.stopTest();

        // Assert the result
        System.assertEquals(Date.newInstance(2025, 01, 11), check1, 'Expected date would be: ' + Date.newInstance(2025, 01, 11));
        System.assertEquals(Date.newInstance(2025, 01, 31), check2, 'Expected date would be: ' + Date.newInstance(2025, 31, 11));
        System.assertEquals(Date.newInstance(2025, 01, 31), check3, 'Expected date would be: ' + Date.newInstance(2025, 31, 11));
        System.assertEquals(Date.newInstance(2025, 01, 01), check4, 'Expected date would be: ' + Date.newInstance(2025, 1, 11));
        
    }
}