<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EmailtoPositionOwnerwhentherearenoInterviewers</fullName>
        <description>Email to Position Owner when there are no Interviewers</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Email_Templates/PositionwithnoInterviewers</template>
    </alerts>
    <fieldUpdates>
        <fullName>AssignNewPositiontoRecruiterQueue</fullName>
        <field>OwnerId</field>
        <lookupValue>RecruiterQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign New Position to Recruiter Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DateOpenedtoToday</fullName>
        <field>Date_Opened__c</field>
        <formula>NOW()</formula>
        <name>Date Opened to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>OwnertoRecruiterQueueonApproval</fullName>
        <field>OwnerId</field>
        <lookupValue>RecruiterQueue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Owner to Recruiter Queue on Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoClosedonNotApproved</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Status to Closed on Not Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StatustoOpenonApproval</fullName>
        <field>Status__c</field>
        <literalValue>Open</literalValue>
        <name>Status to Open on Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStatusforPositionsinProgress</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Pending</literalValue>
        <name>Sub-Status for Positions in Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStatustoApprovedonApproval</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Sub-Status to Approved on Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStatustoNotApprovedonReject</fullName>
        <field>Sub_Status__c</field>
        <literalValue>Not Approved</literalValue>
        <name>Sub-Status to Not Approved on Reject</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>New Position Rule</fullName>
        <actions>
            <name>AssignNewPositiontoRecruiterQueue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Position__c.Status__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Position has no Interviewers</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Position__c.Number_of_Interviewers__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>If a position has no interviewers after 30 days, an email will be sent to the position owner.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>EmailtoPositionOwnerwhentherearenoInterviewers</name>
                <type>Alert</type>
            </actions>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
