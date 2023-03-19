public with sharing class ContactController {
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(){
        throw new AuraHandledException('Error de prueba');
        // try {
        //     return [Select
        //                 FirstName,
        //                 LastName,
        //                 Email
        //             From Contact];
        // } catch (Exception e) {
        //     throw new AuraHandledException(e.getMessage());
        // }
    }
}