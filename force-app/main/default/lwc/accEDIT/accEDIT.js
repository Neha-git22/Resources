import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import Email_FIELD from '@salesforce/schema/Account.Email__c';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class LwcRecordViewForm extends LightningElement {
    @api recordId;
    objectApiName = ACCOUNT_OBJECT;
    nameField = NAME_FIELD;
    EmailField = Email_FIELD;
    phoneField = PHONE_FIELD;

    handleSuccess(event) {
     
        const evt = new ShowToastEvent({
            title: 'Account Updated',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',

        });
        
        this.dispatchEvent(evt);

    }
}