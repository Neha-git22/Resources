import { LightningElement ,track } from 'lwc';
import { RefreshEvent } from 'lightning/refresh';

export default class Quiz extends LightningElement {
    @track checkSubmit = true;
    @track areDetailsVisible = true;
    @track Selanswers = {};
    @track good = true;
    @track score = 0;
    bool=false;
    rerun=false;
    scorebool=false;
    @track set=[];
    percent=0;
    count=0;

    @track elapsedTime = 5;
    intervalId;


    startTimer(){
        this.intervalId = setInterval(() => {
            // Update the elapsed time every second
            this.elapsedTime--;
            if(this.elapsedTime==0){
            clearInterval(this.intervalId);
            this.areDetailsVisible=false;
            
        }
        }, 1000);

        
    }

    // disconnectedCallback() {
    //     // Clear the interval when the component is removed from the DOM
    //     clearInterval(this.elapsedTime);
    // }
    
    questions=[
        {
            id: '1',
            ques: 'Which country is known as the Land of the Rising Sun?',
            answers: [
                { value: 'a', label: 'China' },
                { value: 'b', label: 'Japan' },
                { value: 'c', label: 'South Korea' },
                { value: 'd', label: 'India' }
            ],
            correctAnswer: 'b'
        },
        {
            id: '2',
            ques: 'What is the largest planet in our solar system?',
            answers: [
                { value: 'a', label: 'Mars' },
                { value: 'b', label: 'Jupiter' },
                { value: 'c', label: 'Saturn' },
                { value: 'd', label: 'Earth' }
            ],
            correctAnswer: 'b'
        },
        {
            id: '3',
            ques: 'Who wrote "Hamlet"?',
            answers: [
                { value: 'a', label: 'Jane Austen' },
                { value: 'b', label: 'William Shakespeare' },
                { value: 'c', label: 'Charles Dickens' },
                { value: 'd', label: 'Mark Twain' }
            ],
            correctAnswer: 'b'
        },
        {
            id: '4',
            ques: 'What is the capital city of Canada?',
            answers: [
                { value: 'a', label: 'Ottawa' },
                { value: 'b', label: 'Toronto' },
                { value: 'c', label: 'Vancouver' },
                { value: 'd', label: 'Montreal' }
            ],
            correctAnswer: 'a'
        },
        {
            id: '5',
            ques: 'Which gas makes up the majority of Earth\'s atmosphere?',
            answers: [
                { value: 'a', label: 'Oxygen' },
                { value: 'b', label: 'Carbon Dioxide' },
                { value: 'c', label: 'Nitrogen' },
                { value: 'd', label: 'Hydrogen' }
            ],
            correctAnswer: 'c'
        },
        {
            id: '6',
            ques: 'What is the capital of Australia?',
            answers: [
                { value: 'a', label: 'Sydney' },
                { value: 'b', label: 'Melbourne' },
                { value: 'c', label: 'Canberra' },
                { value: 'd', label: 'Brisbane' }
            ],
            correctAnswer: 'c'
        },
        {
            id: '7',
            ques: 'Who painted the famous artwork "Starry Night"?',
            answers: [
                { value: 'a', label: 'Leonardo da Vinci' },
                { value: 'b', label: 'Vincent van Gogh' },
                { value: 'c', label: 'Pablo Picasso' },
                { value: 'd', label: 'Claude Monet' }
            ],
            correctAnswer: 'b'
        },
        {
            id: '8',
            ques: 'What is the currency of Brazil?',
            answers: [
                { value: 'a', label: 'Peso' },
                { value: 'b', label: 'Euro' },
                { value: 'c', label: 'Real' },
                { value: 'd', label: 'Dollar' }
            ],
            correctAnswer: 'c'
        },
        {
            id: '9',
            ques: 'In what year did the United States declare its independence?',
            answers: [
                { value: 'a', label: '1776' },
                { value: 'b', label: '1789' },
                { value: 'c', label: '1801' },
                { value: 'd', label: '1850' }
            ],
            correctAnswer: 'a'
        }
    ]

    @track totalQuestions = this.questions.length;

    connectedCallback(){
        
        for (let i = 0; i<4; i++) {  
            const randomIndex = Math.floor(Math.random() * 9);  
            console.log(this.randomIndex);
            let randomElement = this.questions[randomIndex];  
            this.set.push(randomElement);
            //console.log('lineee123'+this.set);
        }  

        // if(window.localStorage.getItem("startTimer")){
        //     this.setTimer()
        // }
        this.startTimer();

    }
    
    handleAnswers(event){
        this.count++;
        const questionId = event.target.name;
        const selectedAnswer = event.target.value;
        this.Selanswers = { ...this.Selanswers, [questionId]: selectedAnswer };
        console.log(this.count);
        // if(this.count==this.Selanswers.length){
        //     this.checkSubmit=false;
        // }

        this.checkSubmit=Object.keys(this.Selanswers).length !== this.set.length;
        

    }

    get percentage(){
        return `width:${this.percent}%`

    }

    handleClickSub() {
        this.calculateScore();
        this.areDetailsVisible = false;
        this.scorebool=true;
        this.bool=false;
    }

    handleClickRef(event){
        //console.log(this.totalQuestions);
        this.dispatchEvent(new RefreshEvent());
    }

    calculateScore() {
        this.score = 0;
        this.set.forEach((question) => {
            const userAnswer = this.Selanswers[question.id];
            if (userAnswer === question.correctAnswer) {
                this.score++;
            }
            this.percent=(Number)(this.score*100)/this.set.length;
            if(this.percent>=75){
                this.good=true;
            }
            else{
                this.good=false;
            }
        });
    }

    handleClickRef(event){
        this.bool=true;
        this.scorebool=false;
        this.areDetailsVisible = false;
        
        

    }

    



}