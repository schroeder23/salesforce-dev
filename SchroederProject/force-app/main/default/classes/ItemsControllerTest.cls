@IsTest
public with sharing class ItemsControllerTest {

    @TestSetup
    public static void makeData(){

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
    
    @IsTest
    public static void getItemsTest(){

        Test.startTest();

        List<Item__c> items =  ItemsController.getItems();

        Test.stopTest();

        System.assertEquals(2, items.size());

    }

}
