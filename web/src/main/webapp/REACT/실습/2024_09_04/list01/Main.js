import React from "react";

const Main=(props)=>{
    const numbers = [1,3,5];
    const subject = ['자바','오라클','JSP','Spring','파이썬'];
    
    return(
        <ul>
            {numbers.map((number,idx)=>{
                return <li>{number}</li>
                })

            }
            <br/>

            {subject.map((name)=>{
                return <li >{name}</li>
            })}<br/>       

            {subject.map((name,index)=>{
                return <li key={index}>{name}</li>
            })}<br/>

            {subject.map(function(name,index){
                return <li key={index}>{name}</li>
            })}
        </ul>

    );
}

export default Main;
