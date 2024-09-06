import axios  from "axios";
import React,{useState,useEffect} from "react";

const Main4=()=>{
    const [review,setReview] = useState([]);
    
    useEffect(()=>{
        axios('http://172.30.1.87:80/list')
        .then((response)=>{
            console.log(response);
            console.log(response.data);
            setReview(response.data);
        })
        .catch((error)=>{
            console.error('Error fetching data: ',error);
        });

    },[]);//빈 배열을 전달하여 컴포넌트가 마운트될 때만 한 번 실행되도록 함
    return(
        <div>
            <h1>react ajax연습</h1>
            {review.map((item,index)=>(
                <div key={index}>
                    <h3>mno: {item.mno}</h3>
                    <p>First Name: {item.firstName}</p>
                    <p>Last Name: {item.lastName}</p>   
                </div>
            ))}
        </div>
    );
}

export default Main4;
