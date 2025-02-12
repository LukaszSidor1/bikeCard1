trigger HelloWorldTrigger on Account (before insert) {
    System.debug('Hello World!');
    for(Account a : Trigger.new) {
        a.Description = 'New description';
        System.debug(a.Description);
    }
}