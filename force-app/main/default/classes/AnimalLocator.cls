public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer num) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        String name = '';
        if(response.getStatusCode() == 200){

            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('results: ' + results);
            
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            System.debug('animalProperties: ' + animal);

            name = (String) animal.get('name');
            System.debug('name: ' + name);
        }
        return name;
    }
}