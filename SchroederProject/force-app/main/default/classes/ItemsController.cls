public with sharing class ItemsController {
    
    @AuraEnabled
    public static List<Item__c> getItems(){
        return [SELECT Id, repositoryName__c, nodeId__c, stargazers_count__c, forks__c FROM Item__c];
    }

}
