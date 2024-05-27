import { LightningElement, wire, track } from 'lwc';
import getAcc from '@salesforce/apex/AccIds.getAccIds';
import getCons from '@salesforce/apex/AccIds.getRelCon';
//import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccRelconDATA extends LightningElement {
    @track accData;
    @track conData;
    @track accountId;
    show=false;

    
    accCols = [
        { label: 'Name', fieldName: 'Name', type: 'button', typeAttributes: { label: { fieldName: 'Name' },variant:'base', title: 'Click to View Contacts' }},
        { label: 'Industry', fieldName: 'Industry', type: 'text' },
        { label: 'Type', fieldName: 'Type', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ];

    
    conCols = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' }
    ];


    connectedCallback(){
        getAcc()
            .then(result => {
                
                this.accData = result;
            })
            .catch(error => {
                this.error = error;
                this.accdata = undefined;
            });
    }

    
    handleRowClick(event){
        this.show=true;
        const accountid = event.detail.row.Id;
        
        this.accountId = accountid;

        getCons({ Accid: this.accountId })
            .then(result => {
                this.conData = result;
            })
            .catch(error => {
                this.error = error;
                this.conData = undefined;
            });
        
    }
}