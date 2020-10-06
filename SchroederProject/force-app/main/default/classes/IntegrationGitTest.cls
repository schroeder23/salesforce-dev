@IsTest
public with sharing class IntegrationGitTest {
   
    @IsTest
    public static void createItem(){

        Test.setMock(HttpCalloutMock.class, new IntegrationGitTestMock('SUCCESS_CALL'));

        Test.startTest();

        IntegrationGit.createItem();

        Test.stopTest();

        List<Item__c> lstItem = [SELECT Id, repositoryName__c, nodeId__c, stargazers_count__c, forks__c FROM Item__c];

        System.assertEquals(1, lstItem.size());
        System.assertEquals('MDEwOlJlcG9zaXRvcnkxMjEzOTU1MTA=', lstItem[0].nodeId__c);

    }

}
