import React from "react";

const Main=({name,location,favorList})=>{
    return(
        <div>
            {name}은{location}에 거주 합니다.<br/>
            {favorList.length}개의 음식을 좋아합니다.
        </div>
    );
}

export default Main;
