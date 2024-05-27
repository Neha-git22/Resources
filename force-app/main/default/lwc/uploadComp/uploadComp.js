import { LightningElement,track,api} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import attCreate from '@salesforce/apex/AccAttachment.AccAt';
import uploadFile from '@salesforce/apex/AccAttachment.uploadFile';
import urlcls from '@salesforce/apex/FileUploaderClass.Notecreate';

export default class UploadComp extends LightningElement{
    RadioType;
    PickType;
    Desc;
    @track Attid;
    urlin;
    fileName;
    fileData;
    cdID;
    AtId;
    urlbool=false;
    filebool=false;
    @track isShowModal = false;
    @api myRecordId;
    @api recordId;

    connectedCallback(event){
        
    }

    closeAction() {
        this.dispatchEvent(new CloseActionScreenEvent());
     }


    get Typeoptions(){
        return [
            { label: 'File', value: 'File' },
            { label: 'URL', value: 'URL' }
        ];
    }

    get Fieldoptions(){
        return this.fields;
    }

    get DocToptions(){
        return [
            { label: 'Documents', value: 'Documents' },
            { label: 'Utility', value: 'Utility' }
        ];
    }

    get acceptedFormats() {
        return ['.pdf', '.png'];
    }

    

    
    openfileUpload(event) {
        const file = event.target.files[0]
        var reader = new FileReader()
        reader.onload = () => {
            var base64 = reader.result.split(',')[1]
            this.fileData = {
                'filename': file.name,
                'base64': base64,
                'recordId': this.recordId,
                //'AtId':this.Attid
                
            }
            console.log(this.fileData)
        }
        reader.readAsDataURL(file)
    }
    
    handleClick(){
        console.log(JSON.stringify(this.fileData));
        console.log(this.fileData.base64);
        console.log(this.fileData.filename);
        console.log(this.fileData.recordId);
        //console.log(this.fileData.AtId);
        console.log(this.Attid);
        //const {base64, filename, recorAtId:this.AttId} = this.fileData
        uploadFile({ base64:this.fileData.base64, filename:this.fileData.filename, recordId:this.fileData.recordId,AtId:this.Attid}).then(result=>{
            
            this.cdID=result;
            console.log("gettt"+this.fileData.filename);
            this.dispatchEvent (
                new ShowToastEvent({
                title: 'Doc Created',
                message: 'Record ID: ' + this.fileData.filename,
                variant: 'success',
    
            })
            );
            this.fileData = null;
            //let title = `${this.fileData.filename} uploaded successfully!!`
            //var t=this.fileData.filename;
            //console.log(t);
            //this.toast(t);
            
        })
    }

    SaveAction(event){
        attCreate({ rTy: this.RadioType,pTy: this.PickType,Des: this.Desc,link:this.urlin,id:this.recordId,cd:this.cdID})
            .then(result => {
                this.Attid = result;
                console.log(this.Attid);
                this.dispatchEvent (
                    new ShowToastEvent({
                    title: 'Attachment Created',
                    message: 'Record ID: ' + this.Attid,
                    variant: 'success',
        
                })
                );
            })
            .catch(error => {
                this.error = error;
                console.log("error !!")
            });

            urlcls({ url: this.urlin,recId:this.recordId})
            .then(result => {
                
                console.log(this.result);
                
            })
            .catch(error => {
                this.error = error;
                console.log("error !!")
            });

    }

    // toast(t){
    //     const toastEvent = new ShowToastEvent({
    //        // title:t, 
    //         message: 'Record ID: ' + t,
    //         variant:"success",
    //     });
    //     this.dispatchEvent(toastEvent);
    // }

    showModalBox(){  
        this.isShowModal = true;
        
    }

    hideModalBox() {  
        this.isShowModal = false;
    }

    descInput(event){
        this.Desc=event.target.value;
    }

    RadioInput(event){
        this.RadioType=event.target.value;
        if(this.RadioType=="URL"){
            this.urlbool=true;
            this.filebool=false;
        }
        if(this.RadioType=="File"){
            this.urlbool=false;
            this.filebool=true;
        }
    }

    TypeInput(event){
        this.PickType=event.target.value;

    }

    urlInput(event){
        this.urlin=event.target.value;
    }
}