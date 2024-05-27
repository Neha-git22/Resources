import { LightningElement,track,api } from 'lwc';
import getData from '@salesforce/apex/AccAttachment.LoadFiles';
import {NavigationMixin} from 'lightning/navigation'
import getStat from '@salesforce/apex/AccAttachment.Stat';

export default class AttachmentTabs extends NavigationMixin(LightningElement) {
    @api recordId;
    dataList;
    statbool;
    @api Item;
    

    connectedCallback(event){
        console.log(this.Item);
        getData({recId:this.recordId,})
            .then(result => {
                this.dataList = result;
                // this.dataList = data.map(rec =>({
                //     label: rec.Id,
                //     value: rec.Name
                // }));
                //console.log(this.dataList[0].Type__c);
                
            })
            .catch(error => {
                this.error = error;
                console.log("error !!")
            });

            getStat({aid:this.recordId})
            .then(result => {
                this.statbool = result;
                // this.dataList = data.map(rec =>({
                //     label: rec.Id,
                //     value: rec.Name
                // }));
                //console.log(this.dataList[0].Type__c);
                
            })
            .catch(error => {
                this.error = error;
                console.log("error !!")
            });


    }

    previewHandler(event){
        console.log(event.target.dataset.id)
        this[NavigationMixin.Navigate]({ 
            type:'standard__namedPage',
            attributes:{ 
                pageName:'filePreview'
            },
            state:{ 
                selectedRecordId: event.target.dataset.id
            }
        })
    }

    refHandle(event){
        getData({recId:this.recordId})
            .then(result => {
                this.dataList = result;
                // this.dataList = data.map(rec =>({
                //     label: rec.Id,
                //     value: rec.Name
                // }));
                //console.log(this.dataList[0].Type__c);
                
            })
            .catch(error => {
                this.error = error;
                console.log("error !!")
            });
    }

}