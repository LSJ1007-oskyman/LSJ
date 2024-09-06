import axios from "axios";
import React,{useState} from "react";
import {useNavigate} from "react-router-dom"

const Main6=()=>{
    const[mno,setMno] = useState(0);
    const [ firstName, setFirstName ] = useState('');
    const [ lastName, setLastName ] = useState('');
    
    //const nav = useNavigate();

    const loginaxios=(e)=>{
        e.preventDefault();
        axios.post('http://172.30.1.87:80/register2',{
            mno : mno,
            firstName : firstName,
            lastName : lastName,
        }).then((res)=>{
            console.log(res.data);
            alert(res.data);
            if(res.status===200){
                alert("회원가입 성공");
                //nav('/login')
            }
        }).catch((err)=>{
            console.log(err);
        });
    };

    return(
        <div>
            mno : <input type="text" onChange={(e)=>{
                setMno(e.target.value);
            }}/><br/><br/>
            firstName : <input type="text" onChange={(e)=>{
                setFirstName(e.target.value);
            }}/><br/><br/>
            lastName : <input type="text" onChange={(e)=>{
                setLastName(e.target.value);
            }}/><br/><br/>
            <button onClick={loginaxios}>회원가입</button>
        </div>
    );
}

export default Main6;
