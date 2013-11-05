/**
 * This trigger implements Universal Containers requirements for sending an
 * organization wide chatter notice when a position is in the open/approved state.
 **/
trigger PositionAnnouncementTrigger on Position__c (after insert, after update) { 
	Position__c position = Trigger.new[0];
	if ((Trigger.isInsert 
			|| position.status__c!= Trigger.oldMap.get(position.id).status__c
	  		|| position.sub_status__c!=Trigger.oldMap.get(position.id).sub_status__c)
	  	  && position.status__c =='Open' && position.sub_status__c =='Approved') {
 	
		List <CollaborationGroup> allUserGroup = [SELECT ID FROM CollaborationGroup WHERE name='All Universal Containers' LIMIT 1];
		
		if (allUserGroup.size() > 0) {
			FeedItem post = new FeedItem();
			post.ParentId = allUserGroup[0].id;
			post.Body = 'Recommend someone for new position posted for ' + position.Name + '!!! URL: https://cs14.salesforce.com/' + position.id;
			Database.insert(post);					
		}	  			
	}
}