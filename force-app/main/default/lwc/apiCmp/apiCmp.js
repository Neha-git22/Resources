import { LightningElement } from 'lwc';
import api from '@salesforce/apex/StripePayments.hmrcget';

export default class ApiCmp extends LightningElement{
    handleClick(event){
        api()
    .then(data => {
      console.log('success');})
    .catch(error => {
      this.error = error;
    });

    }
}