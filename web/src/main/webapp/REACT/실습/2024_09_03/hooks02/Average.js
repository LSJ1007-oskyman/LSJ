import React,{useState} from "react";

//평균을 구해주는 함수
const getAverage=(numbers)=>{
    if(numbers.length ===0) return 0;

    //reduce() : numbers배열 원소들의 합을 구해준다.
    const sum = numbers.reduce((a,b)=>a+b);
    return sum/numbers.length;
}
//Average 함수형 컴포넌트
const Average=()=>{
    const [list,setList] = useState([]);
    const [number,setNumber] = useState('');

    //사용자가 입력한 값을 number변수에 할당하는 역할
    const onChange=(e)=>{
        setNumber(e.target.value);
    }

    const onInsert=(e)=>{
        //concat():배열을 결합하여 새로운 배열을 생성하는 함수
        const nextList = list.concat(parseInt(number));
        console.log(nextList);
        setList(nextList);
        setNumber('');
    }

    return(
        <div>
            <input value={number} onChange = {onChange} autoFocus/>
            <button onClick={onInsert}>등록</button>
            <ul>
                {list.map((value,index)=>(
                    <li key = {index}>{value}</li>
                ))}
            </ul>
            <div>
                <b>평균값:</b>{getAverage(list)}
            </div>
        </div>
    );
}

export default Average;
