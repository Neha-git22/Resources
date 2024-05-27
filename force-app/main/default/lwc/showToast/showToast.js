import { LightningElement,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import opp from '@salesforce/apex/FlowOppCreate.OppInsert';

export default class ShowToast extends LightningElement {

   @api recordId;
   @api OppName;
   @api OppStage;
   @api OppCDate;
   @api recordOppId;

   handleNameInput(event){
    this.OppName=event.target.value;
   }
   handleDateInput(event){
    this.OppCDate=event.target.value;
   }
   handleStageInput(event){
    this.OppStage=event.target.value;
    }

   handleClick(event){
    opp({ name: this.OppName, Cdate: this.OppCDate, stage: this.OppStage, accId: this.recordId})
    .then(data => {
      this.recordOppId=data;
      this.dispatchEvent (
        new ShowToastEvent({
        title: 'Opportunity Created',
        message: 'Record ID: ' + this.recordOppId,
        variant: 'success',

    })
    )})
    .catch(error => {
      this.error = error;
    });

}

}