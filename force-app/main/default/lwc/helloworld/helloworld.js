import { LightningElement } from 'lwc';

export default class Helloworld extends LightningElement {
    greetting = 'world';
    changeHandler(event){
        this.greetting = event.target.value;
    }
}