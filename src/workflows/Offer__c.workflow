<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Submitted Offer Requires Attention</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Offer__c.Status__c</field>
            <operation>equals</operation>
            <value>Sent</value>
        </criteriaItems>
        <description>If an offer has been sent, but no word from candidate in 2 days, have recruiter follow up.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Followuponsubmittedoffer</name>
                <type>Task</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Followuponsubmittedoffer</fullName>
        <assignedToType>owner</assignedToType>
        <description>Recruiting has not received a response to an offer submitted to a candidate. Please follow up with candidate</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up on submitted offer</subject>
    </tasks>
</Workflow>
