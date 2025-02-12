public with sharing class ParkLocator {
    public static List<String> country(String country) {

        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();

        List<String> parks = parkService.byCountry(country);
        System.debug('Parks found: ' + parks.size());
        for (String park : parkService.byCountry(country)) {
            System.debug('Park name: ' + park);
        }
        return parks;

    }
}