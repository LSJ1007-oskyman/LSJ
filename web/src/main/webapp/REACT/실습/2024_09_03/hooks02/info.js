import React,{useState} from "react";

const Info=()=>{
    const[name,setName] = useState('');
    const[nickname,setNickname] = useState('');

    const onChangeName=(e)=>{
        setName(e.target.value);
    }

    const onChangeNickname=(e)=>{
        setNickname(e.target.value);
    }

    return(
        <div>
            <div>
                <input onChange={onChangeName}/>
                <input onChange={onChangeNickname}/>
            </div>
            <div>이름:{name}</div>
            <div>닉네임:{nickname}</div>
        </div>
    );
}

export default Info;
