import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
import paymentlink from '@salesforce/apex/StripePayments.Stripesession';

export default class Stripecmp extends NavigationMixin(LightningElement) {

    Redlink='';

    handleClick(event){
        paymentlink({D1:this.Date1 ,D2:this.Date2})
        .then((data) => {
            if (data != null){
                this.Redlink=data;
                this.navigatePage();  
            }
        })
        .catch((error) => {
            console.log('error while fetch acc');
        });
    }

    navigatePage(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            attributes:{
                url:this.Redlink
            }
        });
    }
}