public with sharing class IntegrationGit {

    @Future(callout = true)
    public static void createItem(){
        
        List<Items> results = new List<Items>();

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        HttpResponse response = http.send(request);

        try{

            if (response.getStatusCode() == 200) {

                Map<String, Object> tmpResult = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                List<Object> resultList = (List<Object>) tmpResult.get('items');
                
                for (Object entry : resultList) {
                    results.add((Items)(JSON.deserialize(JSON.serialize(entry), Items.class)));
                }

                List<Item__c> upsertItem = new List<Item__c>();

				Map<String, License__c> mapLicense = new Map<String, License__c>();
				Map<String, Owner__c>   mapOwner   = new Map<String, Owner__c>();

                for(Items item : results){
					License__c license = setLicense(item);
					if(String.isNotBlank(license.node_id__c) && !mapLicense.containsKey(license.node_id__c)){
						mapLicense.put(license.node_id__c, license);
					}
				}

				for(Items item : results){
					Owner__c owner = setOwner(item);
					if(String.isNotBlank(owner.node_id__c) && !mapOwner.containsKey(owner.node_id__c)){
						mapOwner.put(owner.node_id__c, owner);
					}			
				}
				
				if(!mapOwner.values().isEmpty()){
					upsert mapOwner.values();
				}

				if(!mapLicense.values().isEmpty()){
					upsert mapLicense.values();
				}

                for(Items item : results){
					upsertItem.add(setItem(item, mapLicense, mapOwner));
				}

				if(!upsertItem.isEmpty()){
					upsert upsertItem;
				}

            }else{
                System.debug(response.getStatusCode() + ' - ' + response.getStatus());
            }

        }catch(Exception e){
            System.debug(e.getMessage());
        }

    }

	public static License__c setLicense(Items item){

		License__c newLicense = new License__c();

		if(item.license != null){

			License license = item.license;
			
			newLicense.key__c = license.key;
			newLicense.name__c = license.name;
			newLicense.spdx_id__c = license.spdx_id;
			newLicense.url__c = license.url;
			newLicense.node_id__c = license.node_id;

			return newLicense;
			
		}else{
			return newLicense;
		}
	}

	public static Owner__c setOwner(Items item){

		Owner__c newOwner = new Owner__c();

		if(item.Owner != null){

			Owner owner = item.Owner;

			newOwner.login__c = owner.login;
			newOwner.id__c = owner.id;
			newOwner.node_id__c = owner.node_id;
			newOwner.avatar_url__c = owner.avatar_url;
			newOwner.gravatar_id__c = owner.gravatar_id;
			newOwner.url__c = owner.url;
			newOwner.html_url__c = owner.html_url;
			newOwner.followers_url__c = owner.followers_url;
			newOwner.following_url__c = owner.following_url;
			newOwner.gists_url__c = owner.gists_url;
			newOwner.starred_url__c = owner.starred_url;
			newOwner.subscriptions_url__c = owner.subscriptions_url;
			newOwner.organizations_url__c = owner.organizations_url;
			newOwner.repos_url__c = owner.repos_url;
			newOwner.events_url__c = owner.events_url;
			newOwner.received_events_url__c = owner.received_events_url;
			newOwner.type__c = owner.type;
			newOwner.site_admin__c = owner.site_admin;

			return newOwner;

		}else{
			return newOwner;
		}
	}

	public static Item__c setItem(Items item, Map<String, License__c> mapLicense, Map<String, Owner__c> mapOwner){

		Item__c newItem = new Item__c();
		newItem.id__c = item.id;
		newItem.nodeId__c = item.node_id;
		newItem.repositoryName__c = item.name;
		newItem.full_name__c = item.full_name;

		if(item.owner != null){
			Owner owner = item.owner;
			if(mapOwner.containsKey(owner.node_id)){
				newItem.Owner__c = mapOwner.get(owner.node_id).Id;
			}
		}

		newItem.html_url__c = item.html_url;
		newItem.description__c = item.description;
		newItem.fork__c = item.fork;
		newItem.url__c = item.url;
		newItem.forks_url__c = item.forks_url;
		newItem.keys_url__c = item.keys_url;
		newItem.collaborators_url__c = item.collaborators_url;
		newItem.teams_url__c = item.teams_url;
		newItem.hooks_url__c = item.hooks_url;
		newItem.issue_events_url__c = item.issue_events_url;
		newItem.events_url__c = item.events_url;
		newItem.assignees_url__c = item.assignees_url;
		newItem.branches_url__c = item.branches_url;
		newItem.tags_url__c = item.tags_url;
		newItem.blobs_url__c = item.blobs_url;
		newItem.git_tags_url__c = item.git_tags_url;
		newItem.git_refs_url__c = item.git_refs_url;
		newItem.trees_url__c = item.trees_url;
		newItem.statuses_url__c = item.statuses_url;
		newItem.languages_url__c = item.languages_url;
		newItem.stargazers_url__c = item.stargazers_url;
		newItem.contributors_url__c = item.contributors_url;
		newItem.subscribers_url__c = item.subscribers_url;
		newItem.subscription_url__c = item.subscription_url;
		newItem.commits_url__c = item.commits_url;
		newItem.git_commits_url__c = item.git_commits_url;
		newItem.comments_url__c = item.comments_url;
		newItem.issue_comment_url__c = item.issue_comment_url;
		newItem.contents_url__c = item.contents_url;
		newItem.compare_url__c = item.compare_url;
		newItem.merges_url__c = item.merges_url;
		newItem.archive_url__c = item.archive_url;
		newItem.downloads_url__c = item.downloads_url;
		newItem.issues_url__c = item.issues_url;
		newItem.pulls_url__c = item.pulls_url;
		newItem.milestones_url__c = item.milestones_url;
		newItem.notifications_url__c = item.notifications_url;
		newItem.labels_url__c = item.labels_url;
		newItem.releases_url__c = item.releases_url;
		newItem.deployments_url__c = item.deployments_url;
		newItem.git_url__c = item.git_url;
		newItem.ssh_url__c = item.ssh_url;
		newItem.clone_url__c = item.clone_url;
		newItem.svn_url__c = item.svn_url;
		newitem.homepage__c = item.homepage;
		newItem.size__c = item.size;
		newItem.stargazers_count__c = item.stargazers_count;
		newItem.watchers_count__c = item.watchers_count;
		newitem.language__c = item.language;
		newItem.has_issues__c = item.has_issues;
		newItem.has_projects__c = item.has_projects;
		newItem.has_downloads__c = item.has_downloads;
		newItem.has_wiki__c = item.has_wiki;
		newItem.has_pages__c = item.has_pages;
		newItem.forks_count__c = item.forks_count;
		newItem.archived__c = item.archived;
		newItem.disabled__c = item.disabled;
		newItem.open_issues_count__c = item.open_issues_count;

		if(item.license != null){
			License license = item.license;
			if(mapLicense.containsKey(license.node_id)){
				newItem.License__c = mapLicense.get(license.node_id).Id;
			}
		}

		newItem.forks__c = item.forks;
		newItem.open_issues__c = item.open_issues;
		newItem.watchers__c = item.watchers;
		newItem.default_branch__c = item.default_branch;
		newItem.score__c = item.score;
		
		return newItem;

	}
   
   public class Items {

		public Integer id; 
		public String node_id; 
		public String name; 
		public String full_name; 
		public Boolean private_Z;
		public Owner owner; 
		public String html_url; 
		public String description; 
		public Boolean fork; 
		public String url; 
		public String forks_url; 
		public String keys_url; 
		public String collaborators_url; 
		public String teams_url; 
		public String hooks_url; 
		public String issue_events_url; 
		public String events_url; 
		public String assignees_url; 
		public String branches_url; 
		public String tags_url; 
		public String blobs_url; 
		public String git_tags_url; 
		public String git_refs_url; 
		public String trees_url; 
		public String statuses_url; 
		public String languages_url; 
		public String stargazers_url; 
		public String contributors_url; 
		public String subscribers_url; 
		public String subscription_url; 
		public String commits_url; 
		public String git_commits_url; 
		public String comments_url; 
		public String issue_comment_url; 
		public String contents_url; 
		public String compare_url; 
		public String merges_url; 
		public String archive_url; 
		public String downloads_url; 
		public String issues_url; 
		public String pulls_url; 
		public String milestones_url; 
		public String notifications_url; 
		public String labels_url; 
		public String releases_url; 
		public String deployments_url; 
		public String created_at; 
		public String updated_at; 
		public String pushed_at; 
		public String git_url; 
		public String ssh_url; 
		public String clone_url; 
		public String svn_url; 
		public String homepage; 
		public Integer size; 
		public Integer stargazers_count; 
		public Integer watchers_count; 
		public String language; 
		public Boolean has_issues; 
		public Boolean has_projects; 
		public Boolean has_downloads; 
		public Boolean has_wiki; 
		public Boolean has_pages; 
		public Integer forks_count; 
		public MirrorUrl mirror_url; 
		public Boolean archived; 
		public Boolean disabled; 
		public Integer open_issues_count; 
		public License license; 
		public Integer forks; 
		public Integer open_issues; 
		public Integer watchers; 
		public String default_branch; 
		public Double score; 
   }

   public class MirrorUrl{

   }

    public class Owner {
		public String login; 
		public Integer id; 
		public String node_id; 
		public String avatar_url; 
		public String gravatar_id; 
		public String url; 
		public String html_url; 
		public String followers_url; 
		public String following_url; 
		public String gists_url; 
		public String starred_url; 
		public String subscriptions_url; 
		public String organizations_url; 
		public String repos_url; 
		public String events_url; 
		public String received_events_url; 
		public String type;
		public Boolean site_admin; 
    }

    public Integer total_count; 
	public Boolean incomplete_results; 
	public List<Items> items; 

    public class License {
		public String key; 
		public String name; 
		public String spdx_id; 
		public String url; 
		public String node_id; 
    }
}
