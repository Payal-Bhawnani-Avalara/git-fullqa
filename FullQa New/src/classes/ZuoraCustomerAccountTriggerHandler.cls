public class ZuoraCustomerAccountTriggerHandler  extends TriggerHandler{
	
	 //Trigger Handler Methods
    /*
  	protected override void beforeInsert(){}

  	protected override void beforeUpdate(){}

    protected override void beforeDelete(){}

  	protected override void afterInsert(){}

  	protected override void afterDelete(){}

  	protected override void afterUndelete(){}
  	
  	 protected override void afterUpdate(){}
	*/
	
	 /*protected override void afterInsert(){
  	  afterInsertUpdate();
  	}
  	
  	protected override void afterUpdate(){
  	  afterInsertUpdate();
  	}
  	//Developer : Payal Bhawnani
  	//https://jira.avalara.com/browse/IBST-8309
  	//Moving the Automation of Process Builder " Roll up Billing Account Number to Account" on Billing Account object to Trigger due CPU time out error
  	 public void afterInsertUpdate(){
  	 Set<Id> zuoraCustomerAccountIDSet = new Set<Id>();
  	 Set<Id> accountIDs=new Set<Id>();
  	  for( Zuora__CustomerAccount__c zCA : (List<Zuora__CustomerAccount__c>)Trigger.new){
  	  		if(String.isNotBlank(zCA.Zuora__AccountNumber__c)){
	  	 		zuoraCustomerAccountIDSet.add(zCA.id);
	  	 		accountIDs.add(zCA.Zuora__Account__c);
  	  		}
  	 	// zCA.Zuora__Account__r.BillingAccountNumber_s__c = zCA.Zuora__Account__r.BillingAccountNumber_s__c +';' +zCA.Zuora__AccountNumber__c;
  	  }
  	  
  	  if(accountIDs.size()>0 && zuoraCustomerAccountIDSet.size()>0 && !System.isBatch() && !System.isFuture() && !System.isScheduled() && !System.isQueueable()){
         updateBillingAccount(accountIDs,zuoraCustomerAccountIDSet);
        
		//TriggerHandler.clearBypass('AccountTriggerHandler');	
  	  }
  	 }
  	 @future(callout=true)
      public static void updateBillingAccount(Set<Id> accId, Set<ID> zuoraCustomerAccountIDSet){
       List<Account> listAccountsUpdate=new List<Account>();
       List<Account> listAccounts=[Select Id,BillingAccountNumber_s__c,(Select Id,Zuora__AccountNumber__c From Zuora__R00N40000001kyLcEAI__r where id in : zuoraCustomerAccountIDSet) 
    											From Account Where Id=:accId AND ActiveCustomer__c=true];
    	  system.debug('listAccounts======='+listAccounts);
  	   for(Account acc : listAccounts){
  	   	String oldValue=acc.BillingAccountNumber_s__c;
  	    	 for(Zuora__CustomerAccount__c zCA:acc.Zuora__R00N40000001kyLcEAI__r){
  	    	  if(String.isBlank(acc.BillingAccountNumber_s__c)){
  	    	  		acc.BillingAccountNumber_s__c='';
  	    	  }
  	    	  if(String.isNotBlank(zCA.Zuora__AccountNumber__c) &&!acc.BillingAccountNumber_s__c.containsIgnoreCase(zCA.Zuora__AccountNumber__c))
  	 	  {
  	 	     if(String.isNotBlank(acc.BillingAccountNumber_s__c)){
  	 	     		acc.BillingAccountNumber_s__c+=';';
  	 	     }
  	         acc.BillingAccountNumber_s__c += zCA.Zuora__AccountNumber__c;
  	      }
  	     }
  	     if(oldValue!=acc.BillingAccountNumber_s__c){
  	     	listAccountsUpdate.add(acc);
  	     }
       }
          //by pass account trigger 
        if(!Test.isRunningTest()){
		TriggerHandler.bypass('AccountTriggerHandler');
		TriggerHandler.bypass('ZuoraCustomerAccountTriggerHandler');	
        } 
        Database.SaveResult[] dsrList=Database.update(listAccountsUpdate,false);
		Utility.createApexLog('ZuoraCustomerAccountTriggerHandler', dsrList,true);
      }*/
}