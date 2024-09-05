import axios from 'axios';
import './App.css';
const Main1=()=>{
    return(
        <div className="App">
            <h1>react ajax연습</h1>
            <button onClick={()=>{
                axios.get('https://codingapple1.github.io/shop/data2.json')
                     .then((result)=>{
                        console.log('success')
                        console.log('result')
                        console.log('result.data')
                        alert('ok');
                     }).catch(()=>{
                        console.log('fall')
                     })
            }}>요청</button>
        </div>
    );
}

export default Main1;
