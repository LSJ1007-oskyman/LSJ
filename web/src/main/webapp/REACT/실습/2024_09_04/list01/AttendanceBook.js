import React from "react";

const AttendanceBook=(props)=>{
    
    const students=[
        {id:1,name:'홍길동'},
        {id:2,name:'홍길순'},
        {id:3,name:'김길동'},
        {id:4,name:'이상제'}
    ];

    return(
        <ul>
            {students.map((student,idx)=>{
                return <li key={student.id}>{student.name}</li>
            })}
        </ul>
    );
}

export default AttendanceBook;
