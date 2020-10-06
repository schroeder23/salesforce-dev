@IsTest
public with sharing class IntegrationGitSchedulableTest {
    
    @IsTest
    public static void testschedule(){

        Test.StartTest();

        Test.setMock(HttpCalloutMock.class, new IntegrationGitTestMock('SUCCESS_CALL'));

        String sch = '0 0 3 * * ?';

        IntegrationGitSchedulable integrationSchedulable = new IntegrationGitSchedulable(); 
       
        system.schedule('Test check', sch, integrationSchedulable);

        Test.stopTest();

    }
}
