import React,{useState} from "react";

const EventPractice01=()=>{
    const [username,setUsername] =useState('');
    const [message,setMessage] =useState('');

    const onChangeUsername=(e)=>{
        setUsername(e.target.value);
    }

    const onChangeMessage=(e)=>{
        setMessage(e.target.value);
    }

    const onClick=()=>{
        alert(username+':'+message);
        setUsername('');
        setMessage('');
    }

    return(
        <div>
            <h1>이벤트 연습</h1>
            <input type='text'
                   name='username'
                   placeholder='유저명'
                   value={username}
                   onChange={(e)=>{setUsername(e.target.value)}}/>
            <input type='text'
                   name='message'
                   placeholder='아무거나 입력하세요'
                   value={message}
                   onChange={onChangeMessage}/>
            <button onClick={onClick}>확인</button>      
        </div>
    );
}

export default EventPractice01;
