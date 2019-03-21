/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ZIssueUpdaterBatchJob implements Database.AllowsCallouts, Database.Batchable<SObject> {
    global Set<Id> instanceIds;
    global Map<String,String> mappedFields;
    global Boolean notifyOnComplete;
    global ZIssueUpdaterBatchJob(Set<Id> instanceIds, Map<String,String> mappedFields, Boolean notifyOnComplete) {

    }
    global ZIssueUpdaterBatchJob(String sObjName, Set<Id> instanceIds, Map<String,String> mappedFields, Boolean notifyOnComplete) {

    }
    global void execute(Database.BatchableContext bc, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext bc) {

    }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return null;
    }
}