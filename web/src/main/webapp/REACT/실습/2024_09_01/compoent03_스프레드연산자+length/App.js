import logo from './logo.svg';
import './App.css';
import Header from './component/Header';
import Main from './component/Main';
import Footer from './component/Footer';

//스프레드 연산자로 여러개의 값 전달하기
function App() {
  const mainProps = {
    name : '홍길동',
    location : '서울시',
    favorList : ['파스타','빵','떡볶기']
  }
  return (
    <div className="App">
      <Header/>
      <Main {...mainProps}/>   {/* 스프레드연산자 */}
      <Footer/>
    </div>
  );
}

export default App;
