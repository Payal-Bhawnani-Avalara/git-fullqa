<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>Assign Resource Requests Lightning Pages</label>
    <protected>false</protected>
    <values>
        <field>fferpcore__Configuration__c</field>
        <value xsi:type="xsd:string">{
	&quot;pse__Resource_Change__c&quot;: {
        &quot;View&quot;: {
            &quot;lightning&quot;: &quot;pse__Resource_Change_Record_Page__page&quot;
        }
    },
    &quot;pse__Resource_Request_Set__c&quot;: {
        &quot;View&quot;: {
            &quot;lightning&quot;: &quot;pse__Resource_Request_Set_Record_Page__page&quot;
        }
    },
    &quot;pse__Resource_Skill_Request__c&quot;: {
        &quot;View&quot;: {
            &quot;lightning&quot;: &quot;pse__Resource_Skill_Request_Record_Page__page&quot;
        }
    },
    &quot;pse__Resource_Transmission__c&quot;: {
        &quot;View&quot;: {
            &quot;lightning&quot;: &quot;pse__Resource_Transmission_Record_Page__page&quot;
        }
    }
}</value>
    </values>
    <values>
        <field>fferpcore__Feature__c</field>
        <value xsi:type="xsd:string">pse__PsaAssignLightningPages</value>
    </values>
    <values>
        <field>fferpcore__IsOptional__c</field>
        <value xsi:type="xsd:string">Optional</value>
    </values>
    <values>
        <field>fferpcore__StepDescription__c</field>
        <value xsi:type="xsd:string">pse__feature_console_step_lightning_page_assignments_resource_requests</value>
    </values>
    <values>
        <field>fferpcore__StepNumber__c</field>
        <value xsi:type="xsd:double">23.0</value>
    </values>
    <values>
        <field>fferpcore__StepType__c</field>
        <value xsi:type="xsd:string">Action Override</value>
    </values>
</CustomMetadata>