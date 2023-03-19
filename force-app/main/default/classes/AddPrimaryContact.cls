public with sharing class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String stateAbrebation;
    /**
    * @description Constructor of the class
    * @author Renzo Manuel Gomez Cesare | 10-30-2022 
    **/
    public AddPrimaryContact(Contact contact, String stateAbrebation) {
        this.contact = contact;
        this.stateAbrebation = stateAbrebation;
    }

    /**
    * @description Execute the update for billingState
    * @author Renzo Manuel Gomez Cesare | 10-30-2022 
    * @param context 
    **/
    public void execute(QueueableContext context){
        List<Account> lstAccount = [
            SELECT
                Id
            FROM Account
            WHERE
                BillingState = :stateAbrebation
        ];
        List<Contact> lstContact = new List<Contact>();
        for (Account account : lstAccount) {
            Contact cloneContact = contact.clone(false,false,false,false);
            cloneContact.AccountId = account.Id;
            lstContact.add(cloneContact);
        }
        if (lstContact.size() > 0) {
            insert lstContact;
        }
    }
}