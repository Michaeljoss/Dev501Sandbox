<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>StagetoClosedRejected</fullName>
        <field>Stage__c</field>
        <literalValue>Closed - Rejected</literalValue>
        <name>Stage to Closed - Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StagetoPreparingOffer</fullName>
        <field>Stage__c</field>
        <literalValue>Preparing Offer</literalValue>
        <name>Stage to Preparing Offer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoApproved</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoClosed</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Status to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoInApproval</fullName>
        <field>Status__c</field>
        <literalValue>In Approval</literalValue>
        <name>Status to In Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>ApprovedJobApptoHRSystem</fullName>
        <apiVersion>8.0</apiVersion>
        <description>Send info re: candidate to internal HR system in anticipation of candidate accepting offer.</description>
        <endpointUrl>https://www.uc.com/internal-proc</endpointUrl>
        <fields>Average_Review_Score__c</fields>
        <fields>Candidate__c</fields>
        <fields>Email__c</fields>
        <fields>Id</fields>
        <fields>Name__c</fields>
        <fields>OwnerId</fields>
        <fields>Phone__c</fields>
        <fields>Position__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>admin@dev501.11960.com.dvorg</integrationUser>
        <name>Approved Job App to HR System</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <tasks>
        <fullName>Notifycandidatereoffercoming</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please inform the candidate via email/phone to expect an offer letter!</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notify candidate re: offer coming</subject>
    </tasks>
</Workflow>
