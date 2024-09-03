import React,{useState} from 'react';

const TextArea01=()=>{
    const [value,setValue] = useState('');
    
    const handleChange=(e)=>{
        setValue(e.target.value);
    }

    const handleSubmit=(e)=>{
        alert('입력한 요청사항:'+value);
        e.preventDefault();
    }

    return(
        <form onSubmit={handleSubmit}>
            <label>
                요청사항: <br/>
                <textarea cols='40' rows='5' value={value} onChange={handleChange} placeholder='요청사항을 입력하세요.' />
            </label><br/>
            <button type='submit' >제출</button><br/>
            요청사항: {value}
        </form>
    );
}

export default TextArea01;
