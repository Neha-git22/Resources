import { LightningElement, track, api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import opp from '@salesforce/apex/OppRecord.Oppinsert';


export default class OppCREATE extends NavigationMixin(LightningElement) {
       @track Name;
       @track Date;
       @track StageName;
       @track recordId;
    
    handleNameInput(event){
        this.Name=event.target.value;
    }
    handleDateInput(event){
        this.Date=event.target.value;
    }
    handleStageInput(event){
        this.StageName=event.target.value;
    }

    handleClick(event){
        opp({ name: this.Name, Cdate: this.Date, stage: this.StageName})
        .then(data => {
          this.recordId=data;
          this.dispatchEvent (
            new ShowToastEvent({
            title: 'Opportunity Created',
            message: 'Record ID: ' + this.recordId,
            variant: 'success',

        })
        );
        
        this[NavigationMixin.GenerateUrl]({
                type: 'standard__recordPage',
                attributes: {
                    recordId:this.recordId,
                    actionName: 'view',
                },
            }).then((url) => {
                this.recordPageUrl = url;
            });
        

    })
        .catch(error => {
          this.error = error;
        });

    }  

    handleClear(event){
        this.Name='';
        this.Date='';
        this.StageName='';
    }
}