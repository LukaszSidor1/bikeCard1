@isTest
private class AnimalLocatorTest {
    @isTest
    static void testGetAnimalNameById() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Perform the callout
        String result = AnimalLocator.getAnimalNameById(1);

        // Single assertion to verify response body is not null
        Assert.isNotNull(result, 'The response body should not be null.');
    }
}