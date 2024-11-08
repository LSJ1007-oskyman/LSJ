import React,{useState} from "react";

const Say=()=>{
    const [message,setMessage] = useState('');
    const[color,setColor]=useState('black');
    const onClickEnter=()=>{
        setMessage("안녕 하세요?");
    }
    const onClickLeave=()=>{
        setMessage("안녕 가세요!");
    }
    return(
        <div>
            <button onClick={()=>setMessage('안녕?')}>입장1</button>
            <button onClick={onClickEnter}>입장2</button>
            <button onClick={onClickLeave}>퇴장</button>
            <h1 style={{color}}>{message}</h1>

            <button style={{color:'red'}} onClick={()=>setColor('red')}>빨간색</button>
            <button style={{color:'green'}} onClick={()=>setColor('green')}>초록색</button>
            <button style={{color:'blue'}} onClick={()=>setColor('blue')}>파란색</button>
        </div>
    );
    
}

export default Say;
