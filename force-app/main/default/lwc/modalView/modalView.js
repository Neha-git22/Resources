import { LightningElement,track } from 'lwc';
import getObs from '@salesforce/apex/Modalclass.getObjs';
import getObflds from '@salesforce/apex/Modalclass.getFields';

export default class ModalView extends LightningElement{
    obs=[];
    fields=[];
    SelObjType='';
    SelObj='';
    @track isShowModal = false;
    get Typeoptions() {
        return [
            { label: 'Standard', value: 'Standard' },
            { label: 'Custom', value: 'Custom' }
        ];
    }

    get Fieldoptions(){
        return this.fields;
    }

    get OBJoptions(){
        return this.obs;
    }

    showModalBox(){  
        this.isShowModal = true;
        
    }

    hideModalBox() {  
        this.isShowModal = false;
    }

    handleTypeChange(event){
         this.SelObjType=event.target.value;
         console.log(this.SelObjType);
         getObs({type:this.SelObjType})
        .then((data) => {
            if (data != null) {
                this.obs = data.map(rec =>({
                    label: rec.QualifiedApiName,
                    value: rec.QualifiedApiName
                }));
                
                console.log(this.obs);
            }
        })
        .catch((error) => {
            console.log('error while fetch acc');
        });
         
    }
    handleObjChange(event){
        this.SelObj=event.target.value;
        getObflds({Obj:this.SelObj})
        .then((data) => {
            if (data != null) {
                this.fields = data.map(rec =>({
                    label: rec.QualifiedApiName,
                    value: rec.QualifiedApiName
                }));
                
                console.log(this.fields);
            }
        })
        .catch((error) => {
            console.log('error while fetch acc');
        });

    }
}