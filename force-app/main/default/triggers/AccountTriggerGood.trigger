trigger AccountTriggerGood on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    // Contex Variables
    System.debug('----------------------------------------');
    System.debug('Context Variables: ');
    System.debug('Trigger.isExecuting: ' + Trigger.isExecuting);
    System.debug('Trigger.size: ' + Trigger.size);
    System.debug('Trigger.new: ' + Trigger.new);
    System.debug('Trigger.newMap: ' + Trigger.newMap);
    System.debug('Trigger.old: ' + Trigger.old);
    System.debug('Trigger.oldMap: ' + Trigger.oldMap);
    System.debug('----------------------------------------');
    
    /*
    // Before Triggers
    if(Trigger.isInsert && Trigger.isBefore) {
        System.debug('Before Insert');
        //AccountTriggerHandler.beforeInsert(Trigger.newMap);
    }
    if(Trigger.isUpdate && Trigger.isBefore) {
        System.debug('Before Update');
        AccountTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
    
    if(Trigger.isDelete && Trigger.isBefore) {
        System.debug('Before Delete');
        AccountTriggerHandler.beforeDelete(Trigger.oldMap, Trigger.old);
    }

    // After Triggers
    if(Trigger.isInsert && Trigger.isAfter) {
        System.debug('After Insert');
        AccountTriggerHandler.afterInsert(Trigger.new);
    }
    if(Trigger.isUpdate && Trigger.isAfter) {
        System.debug('After Update');
        AccountTriggerHandler.afterUpdate(Trigger.new);
    }
    if(Trigger.isDelete && Trigger.isAfter) {
        System.debug('After Delete');
        AccountTriggerHandler.afterDelete(Trigger.oldMap);
    }
    if(Trigger.isUndelete) {
        System.debug('After Undelete');
        AccountTriggerHandler.afterUndelete(Trigger.newMap);
    }*/

}