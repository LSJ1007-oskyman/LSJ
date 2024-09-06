import axios  from "axios";
import React,{useState,useEffect} from "react";

const Main3=()=>{
    const [review,setReview] = useState([]);
    
    useEffect(()=>{
        axios('http://172.30.1.87:80/sample')
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
            mno: {review.mno}<br/>
            First Name: {review.firstName}<br/>
            Last Name: {review.lastName}<br/>
        </div>
    );
}

export default Main3;
