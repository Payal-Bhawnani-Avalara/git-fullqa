public with sharing class ZuoraAccountProcess {
  public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }

  public PageReference upload() {
  	if(attachment==null || attachment.name==null || !attachment.name.endsWithIgnoreCase('.csv')){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Please upload CSV file.'));
	  attachment = new Attachment(); 
      return null;  		
  	}
	Zuora_Account_Process__c z=new Zuora_Account_Process__c(Name=attachment.name,Status__c='Processed');
	insert z;
    attachment.OwnerId = UserInfo.getUserId();
    attachment.ParentId = z.Id; // the record the file is attached to
   // attachment.IsPrivate = true;

    try {
      insert attachment;
      String body=attachment.body.toString();
      List<List<String>> allLines=parseCSV(body,false);
      List<Zuora_Account_Process__c> listAllRecords=new List<Zuora_Account_Process__c>();
      for(List<String> line:allLines){
      	listAllRecords.add(new Zuora_Account_Process__c(Name=line[0],File_Name__c=attachment.name,Status__c='New'));
      }
      insert listAllRecords;
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      delete z;
      return null;
    } finally {
      attachment = new Attachment(); 
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }
	public static List<List<String>> parseCSV(String contents,Boolean skipHeaders) {
		List<List<String>> allFields = new List<List<String>>();
	
		// replace instances where a double quote begins a field containing a comma
		// in this case you get a double quote followed by a doubled double quote
		// do this for beginning and end of a field
		contents = contents.replaceAll(',"""',',"DBLQT').replaceall('""",','DBLQT",');
		// now replace all remaining double quotes - we do this so that we can reconstruct
		// fields with commas inside assuming they begin and end with a double quote
		contents = contents.replaceAll('""','DBLQT');
		// we are not attempting to handle fields with a newline inside of them
		// so, split on newline to get the spreadsheet rows
		List<String> lines = new List<String>();
		try {
			lines = contents.split('\n');
		} catch (System.ListException e) {
			System.debug('Limits exceeded?' + e.getMessage());
		}
		Integer num = 0;
		for(String line : lines) {
			// check for blank CSV lines (only commas)
			if (line.replaceAll(',','').trim().length() == 0) break;
			
			List<String> fields = line.split(',');	
			List<String> cleanFields = new List<String>();
			String compositeField;
			Boolean makeCompositeField = false;
			for(String field : fields) {
				/*if (field.startsWith('"') && field.endsWith('"')) {
					cleanFields.add(field.replaceAll('DBLQT','"'));
				} else if (field.startsWith('"')) {
					makeCompositeField = true;
					compositeField = field;
				} else if (field.endsWith('"')) {
					compositeField += ',' + field;
					cleanFields.add(compositeField.replaceAll('DBLQT','"'));
					makeCompositeField = false;
				} else if (makeCompositeField) {
					compositeField +=  ',' + field;
				} else {*/
					cleanFields.add(field.replaceAll('DBLQT','"'));
				//}
			}
			
			allFields.add(cleanFields);
		}
		if (skipHeaders) allFields.remove(0);
		return allFields;		
	}      
}