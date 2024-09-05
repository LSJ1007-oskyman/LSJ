import React from "react";
import {useParams} from 'react-router-dom'

const Product=(props)=>{
    const {productId} = useParams();
    const param =useParams().productId;
    return(
        <div>
            <h3>{productId}번 상품 페이지 입니다.(Product.js)</h3>
            <h3>{param}번 상품 페이지 입니다.(Product.js)</h3>
        </div>
    );
}

export default Product;
