import axios from "axios";

const Main5=()=>{
    const loginaxios=(e)=>{
        e.preventDefault();
        axios.post('http://172.30.1.87:80/register',{
            mno : 10,
            firstName : "hong",
            lastName : "gildong"
        }).then((res)=>{
            console.log(res.data);
            alert(res.data);
            if(res.status===200){
                alert("회원가입 성공");
            }
        }).catch((err)=>{
            console.log(err);
        });
    };
    return(
        <div>
            <button onClick={loginaxios}>회원가입</button>
        </div>
    );
}

export default Main5;
