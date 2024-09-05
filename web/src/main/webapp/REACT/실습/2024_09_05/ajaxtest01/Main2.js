import axios  from "axios";
import React,{useState,useEffect} from "react";

const Main2=()=>{
    const[review,setReview]=useState([]);
    //화면이 실행 될때 한번만 실행하기
    useEffect(()=>{
        axios.get('https://codingapple1.github.io/shop/data2.json')
        .then((result)=>{
            console.log(result)
            setReview(result.data)
        }).catch((err)=>{
            console.log(err)
        })
    },[])
    return(
        <div>
            <h1>react ajax연습</h1>
            {review.map((item,index)=>(
                <div key={index}>
                    <h3>id:{item.id}</h3>
                    <p>title:{item.title}</p>
                    <p>content:{item.content}</p>
                    <p>price:{item.price}</p>
                </div>
            ))}
        </div>
    );
}

export default Main2;
