public with sharing class ItemTriggerHandler {
    
    public static void insertItemSharingRules(List<Item__c> newRecordsList){

        Set<Id> itemIds = new Set<Id>();

        for(Item__c item : newRecordsList){
            itemIds.add(item.Id);
        }

        List<Item__Share > existentItemSharings = [SELECT Id, UserOrGroupId, ParentId FROM Item__Share WHERE ParentId IN : itemIds];

        Set<String> itemShareKeys = new Set<String>();

        for(Item__Share itemShare : existentItemSharings){
            itemShareKeys.add(itemShare.parentId + '_' + itemShare.UserOrGroupId);
        }

        Id profileId = [SELECT Id FROM Profile WHERE Name = 'Usuário Padrão'].Id;

        User u = [SELECT Id FROM User WHERE ProfileId =: profileId LIMIT 1];

        List<Item__Share> itemSharingsToInsert = new List<Item__Share>();

        for(Item__c item : newRecordsList){

            if(!itemShareKeys.contains(item.Id + '_' + u.Id)){

                Item__Share itemShare = new Item__Share(
                    AccessLevel = 'Read',
                    parentId = item.Id,
                    userOrGroupId = u.Id,
                    RowCause = 'Manual'
                );
                itemSharingsToInsert.add(itemShare);
            }
        }

        if(!itemSharingsToInsert.isEmpty()){
            insert itemSharingsToInsert;
        }
    }
}
