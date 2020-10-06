public with sharing class IntegrationGitTestMock implements HttpCalloutMock{
   
    private String responseType;
	private Integer httpCode;

	public IntegrationGitTestMock(String responseType){
		this.responseType = responseType;
	}
    
    public IntegrationGitTestMock(Integer httpCode){
		this.httpCode = httpCode;
	}

	public HttpResponse respond(HttpRequest req){
		HttpResponse response = new HttpResponse();

		if (httpCode != null){
			if(httpCode == 500){
				response.setStatus('ERROR');
				response.setStatusCode(httpCode);
				response.setHeader('Content-type', 'application/json; charset=utf-8');
				return response;

			} else {
				response.setStatus('ERROR');
				response.setStatusCode(httpCode);
				response.setHeader('Content-size', '0');
				return response;
			}
		} else {
			response.setStatus('OK');
			response.setStatusCode(200);
			response.setHeader('Content-type', 'application/json');
			response.setBody(getCorrectPayload());
			return response;
		}
	}

    private String getCorrectPayload(){
		switch on responseType {
			when 'SUCCESS_CALL'{
				return getSuccessfulCall();
			}
        }
        return '';
    }

    public String getSuccessfulCall(){
        return(
            '{'+
                '"total_count": 8624685,'+
                '"incomplete_results": true,'+
                '"items": ['+
                    '{' +
                        '"id": 121395510,' +
                        '"node_id": "MDEwOlJlcG9zaXRvcnkxMjEzOTU1MTA=",' +
                        '"name": "CS-Notes",' +
                        '"full_name": "CyC2018/CS-Notes",' +
                        '"private": false,' +
                        '"owner": {' +
                            '"login": "CyC2018",' +
                            '"id": 36260787,' +
                            '"node_id": "MDQ6VXNlcjM2MjYwNzg3",' +
                            '"avatar_url": "https://avatars3.githubusercontent.com/u/36260787?v=4",' +
                            '"gravatar_id": "",' +
                            '"url": "https://api.github.com/users/CyC2018",' +
                            '"html_url": "https://github.com/CyC2018",' +
                            '"followers_url": "https://api.github.com/users/CyC2018/followers",' +
                            '"following_url": "https://api.github.com/users/CyC2018/following{/other_user}",' +
                            '"gists_url": "https://api.github.com/users/CyC2018/gists{/gist_id}",' +
                            '"starred_url": "https://api.github.com/users/CyC2018/starred{/owner}{/repo}",' +
                            '"subscriptions_url": "https://api.github.com/users/CyC2018/subscriptions",' +
                            '"organizations_url": "https://api.github.com/users/CyC2018/orgs",' +
                            '"repos_url": "https://api.github.com/users/CyC2018/repos",' +
                            '"events_url": "https://api.github.com/users/CyC2018/events{/privacy}",' +
                            '"received_events_url": "https://api.github.com/users/CyC2018/received_events",' +
                            '"type": "User",' +
                            '"site_admin": false' +
                        '},'+
                        '"html_url": "https://github.com/CyC2018/CS-Notes",' +
                        '"description": ":books: 技术面试必备基础知识、Leetcode、计算机操作系统、计算机网络、系统设计、Java、Python、C++",' +
                        '"fork": false,' +
                        '"url": "https://api.github.com/repos/CyC2018/CS-Notes",' +
                        '"forks_url": "https://api.github.com/repos/CyC2018/CS-Notes/forks",' +
                        '"keys_url": "https://api.github.com/repos/CyC2018/CS-Notes/keys{/key_id}",' +
                        '"collaborators_url": "https://api.github.com/repos/CyC2018/CS-Notes/collaborators{/collaborator}",' +
                        '"teams_url": "https://api.github.com/repos/CyC2018/CS-Notes/teams",' +
                        '"hooks_url": "https://api.github.com/repos/CyC2018/CS-Notes/hooks",' +
                        '"issue_events_url": "https://api.github.com/repos/CyC2018/CS-Notes/issues/events{/number}",' +
                        '"events_url": "https://api.github.com/repos/CyC2018/CS-Notes/events",' +
                        '"assignees_url": "https://api.github.com/repos/CyC2018/CS-Notes/assignees{/user}",' +
                        '"branches_url": "https://api.github.com/repos/CyC2018/CS-Notes/branches{/branch}",' +
                        '"tags_url": "https://api.github.com/repos/CyC2018/CS-Notes/tags",' +
                        '"blobs_url": "https://api.github.com/repos/CyC2018/CS-Notes/git/blobs{/sha}",' + 
                        '"git_tags_url": "https://api.github.com/repos/CyC2018/CS-Notes/git/tags{/sha}",' +
                        '"git_refs_url": "https://api.github.com/repos/CyC2018/CS-Notes/git/refs{/sha}",' +
                        '"trees_url": "https://api.github.com/repos/CyC2018/CS-Notes/git/trees{/sha}",' +
                        '"statuses_url": "https://api.github.com/repos/CyC2018/CS-Notes/statuses/{sha}",' +
                        '"languages_url": "https://api.github.com/repos/CyC2018/CS-Notes/languages",' +
                        '"stargazers_url": "https://api.github.com/repos/CyC2018/CS-Notes/stargazers",' +
                        '"contributors_url": "https://api.github.com/repos/CyC2018/CS-Notes/contributors",' +
                        '"subscribers_url": "https://api.github.com/repos/CyC2018/CS-Notes/subscribers",' +
                        '"subscription_url": "https://api.github.com/repos/CyC2018/CS-Notes/subscription",' +
                        '"commits_url": "https://api.github.com/repos/CyC2018/CS-Notes/commits{/sha}",' +
                        '"git_commits_url": "https://api.github.com/repos/CyC2018/CS-Notes/git/commits{/sha}",' +
                        '"comments_url": "https://api.github.com/repos/CyC2018/CS-Notes/comments{/number}",' +
                        '"issue_comment_url": "https://api.github.com/repos/CyC2018/CS-Notes/issues/comments{/number}",' +
                        '"contents_url": "https://api.github.com/repos/CyC2018/CS-Notes/contents/{+path}",' +
                        '"compare_url": "https://api.github.com/repos/CyC2018/CS-Notes/compare/{base}...{head}",' +
                        '"merges_url": "https://api.github.com/repos/CyC2018/CS-Notes/merges",' +
                        '"archive_url": "https://api.github.com/repos/CyC2018/CS-Notes/{archive_format}{/ref}",' +
                        '"downloads_url": "https://api.github.com/repos/CyC2018/CS-Notes/downloads",' +
                        '"issues_url": "https://api.github.com/repos/CyC2018/CS-Notes/issues{/number}",' +
                        '"pulls_url": "https://api.github.com/repos/CyC2018/CS-Notes/pulls{/number}",' +
                        '"milestones_url": "https://api.github.com/repos/CyC2018/CS-Notes/milestones{/number}",' +
                        '"notifications_url": "https://api.github.com/repos/CyC2018/CS-Notes/notifications{?since,all,participating}",' +
                        '"labels_url": "https://api.github.com/repos/CyC2018/CS-Notes/labels{/name}",' +
                        '"releases_url": "https://api.github.com/repos/CyC2018/CS-Notes/releases{/id}",'+
                        '"deployments_url": "https://api.github.com/repos/CyC2018/CS-Notes/deployments",' +
                        '"created_at": "2018-02-13T14:56:24Z",' +
                        '"updated_at": "2020-10-04T19:09:27Z",' +
                        '"pushed_at": "2020-10-01T17:18:31Z",' +
                        '"git_url": "git://github.com/CyC2018/CS-Notes.git",' +
                        '"ssh_url": "git@github.com:CyC2018/CS-Notes.git",' +
                        '"clone_url": "https://github.com/CyC2018/CS-Notes.git",' +
                        '"svn_url": "https://github.com/CyC2018/CS-Notes",' +
                        '"homepage": "https://cyc2018.github.io/CS-Notes",' +
                        '"size": 111694,' +
                        '"stargazers_count": 112029,' +
                        '"watchers_count": 112029,' +
                        '"language": "Java",' +
                        '"has_issues": true,' +
                        '"has_projects": true,' +
                        '"has_downloads": true,' +
                        '"has_wiki": true,' +
                        '"has_pages": true,' +
                        '"forks_count": 36579,' +
                        '"mirror_url": null,' +
                        '"archived": false,' +
                        '"disabled": false,' +
                        '"open_issues_count": 66,' +
                        '"license": null,' +
                        '"forks": 36579,' +
                        '"open_issues": 66,' +
                        '"watchers": 112029,' +
                        '"default_branch": "master",' +
                        '"score": 1.0' +
                    '}'+
                ']' +
            '}'   
        );
    }
}
