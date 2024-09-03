import React,{useState} from "react"

const Form01=(props)=>{
    const [value,setValue] =useState('');

    const handleChange=(event)=>{
        // setValue(event.target.value);
        setValue(event.target.value.toUpperCase());
    }

    const handleSubmit=(event)=>{
        alert('입력한 이름:'+value);
        event.preventDefault();        //새로고침 방지
    }

    return(
        <form onSubmit={handleSubmit}>
            <label>
                이름: <input type="text" value = {value} onChange={handleChange}/>
            </label>
            <button type="submit">제출</button>
            <br></br>
            이름: {value}
        </form>
    );
}

export default Form01;
