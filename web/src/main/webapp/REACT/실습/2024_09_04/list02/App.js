import logo from './logo.svg';
import './App.css';
import Main1 from './Main1';
import Main2 from './Main2';
import Main3 from './Main3';

function App() {
  const names1=['홍길동','홍길순','김길동'];
  const names2=[['홍길동',19],['홍길순',29],['김길동',39]];
  const names3=[{userName:'홍길동',age:19},{userName:'홍길순',age:29},{userName:'김길동',age:39}];
  
  const nameList1=names1.map((n)=>(<Main1 name={n}/>));
  const nameList2=names2.map((v)=>(<Main2 name={v[0]} age={v[1]}/>));
  const nameList3=names3.map((v)=>(<Main3 name={v.userName} age={v.age}/>));

  //filter함수를 이용해서 age가 30보다 큰데이터만 자식 컴포넌트에게 전달하기
  let nameList4=names3.filter(v=>v.age>30);//저 nameList4는 다음 코드에 재사용하기 위해서 let로 선언
  nameList4= nameList4.map((v)=>(<Main3 name={v.userName} age={v.age}/>))
  return (
    <div className='App'>
      {nameList1}<hr/>
      {nameList2}<hr/>
      {nameList3}<hr/>
      {nameList4}<hr/>
    </div>
  );
}

export default App;
