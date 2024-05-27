import { LightningElement, api,track } from 'lwc';
import getAcc from '@salesforce/apex/AccIds.getAccIds';
import getCons from '@salesforce/apex/AccIds.getRelCon';

export default class AccRelconCUST extends LightningElement {
    @track accData;
    @track conData;
    @track accountId;
    show=false;
    rowId;


    connectedCallback(event){
        getAcc()
            .then(result => {
                
                this.accData = result;
            })
            .catch(error => {
                this.error = error;
                this.accdata = undefined;
            });
    }

    handleNameClick(event){
        this.show=true;
    this.rowId = event.target.value;
    
        

        console.log(this.rowId);
        // const rowClickEvent = new CustomEvent('rowclick', {
        //     detail: rowId
        // });
        // this.dispatchEvent(rowClickEvent);
        getCons({ Accid: this.rowId })
            .then(result => {
                this.conData = result;
            })
            .catch(error => {
                this.error = error;
                this.conData = undefined;
            });
        
    }
}