<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AssignNewCandidatetoRecruiterQueue</fullName>
        <field>OwnerId</field>
        <lookupValue>RecruiterQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign New Candidate to Recruiter Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Candidate Notification</fullName>
        <actions>
            <name>AssignNewCandidatetoRecruiterQueue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Candidate__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
