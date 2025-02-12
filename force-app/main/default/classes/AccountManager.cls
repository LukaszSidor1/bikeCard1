@RestResource(urlMapping='/Accounts/*/contacts/')

global with sharing class AccountManager {
    @HttpGet
    global static void getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        


    }
}