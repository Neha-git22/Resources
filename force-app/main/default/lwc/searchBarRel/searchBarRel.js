import { LightningElement, track} from 'lwc';

import acc from '@salesforce/apex/RelRecords.GetRelRecords';

export default class SearchBarRel extends LightningElement {
@track queryTerm;
@track errors;
@track tabledata;
@track columns = [
    { label: 'Account Id', fieldName:'Id'},
    { label: 'Account Name', fieldName:'Name'},
    { label: 'Email', fieldName:'Email__c'}
];

handleDataT(evt) {
    data=true;
        this.queryTerm = evt.target.value;
        acc({ accName: this.queryTerm })
        .then(data => {
          this.tabledata=data;
        })
        .catch(error => {
          this.error = error;
        }); 
}

}