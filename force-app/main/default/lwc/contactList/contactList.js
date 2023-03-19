import { LightningElement, wire } from 'lwc';
import CONTACT_FIELD_FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import CONTACT_FIELD_LASTNAME from '@salesforce/schema/Contact.LastName';
import CONTACT_FIELD_EMAIL from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { reduceErrors } from 'c/ldsUtils';
const COLUMNS  = [
    {label: 'Contact FirstName', fieldName: CONTACT_FIELD_FIRSTNAME.fieldApiName, type:'text'},
    {label: 'Contact LastName', fieldName: CONTACT_FIELD_LASTNAME.fieldApiName, type:'text'},
    {label: 'Contact Email', fieldName: CONTACT_FIELD_EMAIL.fieldApiName, type:'text'}
];

export default class ContactList extends LightningElement {
    columns = COLUMNS;
    @wire(getContacts)
    contacts
    get errors(){
        return (this.contacts.error) ? reduceErrors(this.contacts.error) : [];
    };
}