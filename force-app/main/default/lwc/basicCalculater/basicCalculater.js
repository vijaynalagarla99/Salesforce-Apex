import { LightningElement } from 'lwc';
export default class BasicCalculater extends LightningElement 
{
    firstNumber;
    secondNumber;
    OperationResult;

    changing(event)
    {
        const elementname = event.target.name;
        const elementvalue = event.target.value;

        if(elementname === 'fname')
            {
                this.firstNumber = elementvalue;
            }
        else
        {
            this.secondNumber = elementvalue;
        }
    }
    addition()
    {
        this.OperationResult = parseInt(this.firstNumber) + parseInt(this.secondNumber);
    }
    Sub()
    {
        this.OperationResult = parseInt(this.firstNumber) - parseInt(this.secondNumber);
    }
    Mul()
    {
        this.OperationResult = parseInt(this.firstNumber) * parseInt(this.secondNumber);
    }
    divi()
    {
        this.OperationResult = parseInt(this.firstNumber) / parseInt(this.secondNumber);
    }
    Modul()
    {
        this.OperationResult = parseInt(this.firstNumber) % parseInt(this.secondNumber);
    }
}