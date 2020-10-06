({
    init: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Repository Name', fieldName: 'repositoryName__c', type: 'text'},
            {label: 'NodeId', fieldName: 'nodeId__c', type: 'text'},
            {label: 'Number of Stars ', fieldName: 'stargazers_count__c', type: 'number'},
            {label: 'Number of Forks', fieldName: 'forks__c', type: 'number'}
        ]);

        helper.fetchData(component, event, helper);

    }
})
