@IsTest
public with sharing class ItemTriggerHandlerTest {
    
    @IsTest
    public static void insertItemSharingRulesTest(){

        Id profileId = [SELECT Id FROM Profile WHERE Name = 'Usuário Padrão'].Id;

        User u = new User();
        u.Username = 'marschre@teste.com';
        u.lastName = 'Schroeder';
        u.email = 'marluaschroeder@teste.com';
        u.alias = 'sch';
        u.communityNickname = 'Dir. Schroeder';
        u.emailEncodingKey = 'ISO-8859-1';
        u.languageLocaleKey = 'en_US';
        u.profileId = profileId;
        u.localeSidKey = 'en_US';
        u.timeZoneSidKey = 'America/New_York';
        u.profileId = profileId;

        insert u;

        List<Item__c> lstItem = new List<Item__c>();

        Item__c item = new Item__c();
        item.repositoryName__c = 'CS-Notes';
        item.nodeId__c = 'MDEwOlJlcG9zaXRvcnkxMjEzOTU1MTA=';
        item.stargazers_count__c =  112029;
        item.forks__c = 36579;
        lstItem.add(item);

        Item__c item2 = new Item__c();
        item2.repositoryName__c = 'JavaGuide';
        item2.nodeId__c = 'MDEwOlJlcG9zaXRvcnkxMzI0NjQzOTU=';
        item2.stargazers_count__c =  89007;
        item2.forks__c = 30792;
        lstItem.add(item2);

        insert lstItem;
    }
}
