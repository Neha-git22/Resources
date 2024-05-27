import { LightningElement } from 'lwc';
export default class DynamicCss extends LightningElement {
    percent=20;

    handlechange(event){
        this.percent=event.target.value;
        console.log('linee7'+this.percent) ;  
         }
    
    get percentage(){
        return `width:${this.percent}%`

    }

    get isScoreCheck() {
        return `slds-text-heading_medium ${(this.percent)
            ? "slds-text-color_success"
            : "slds-text-color_error"}`
    }

}