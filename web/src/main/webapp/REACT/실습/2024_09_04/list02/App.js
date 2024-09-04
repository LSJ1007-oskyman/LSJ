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

  return (
    <div className='App'>
      {nameList1}<hr/>
      {nameList2}<hr/>
      {nameList3}<hr/>
    </div>
  );
}

export default App;
