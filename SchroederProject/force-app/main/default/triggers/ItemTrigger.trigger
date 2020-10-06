trigger ItemTrigger on Item__c (after insert) {

    if(Trigger.isInsert){
        ItemTriggerHandler.insertItemSharingRules(Trigger.new);
    }
}