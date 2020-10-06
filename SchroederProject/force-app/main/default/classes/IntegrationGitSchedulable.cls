global with sharing class IntegrationGitSchedulable implements Schedulable {

    global void execute(SchedulableContext sc){
        IntegrationGit.createItem();
    }
}
