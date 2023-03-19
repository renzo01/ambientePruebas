trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account newAccount : Trigger.new) {
        if(newAccount.Match_Billing_Address__c == true){
            newAccount.BillingPostalCode = newAccount.ShippingPostalCode;
        }
    }
}
