import './App.css';
import Header from './Header';
import Main from './Main';
import NotFound from './NotFound';
import Product from './Product';
import Footer from './Footer';
import {BrowserRouter,Routes,Route} from 'react-router-dom'

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Header/><hr/>
        <Routes>
            {/* 슬래시(/)로 요청하면 Main.js컴포넌트를 실행 */}
            <Route path='/' element={<Main/>}/>
            {/* /product/1로 요청하면 Product.js컴포넌트를 실행 */}
            <Route path='/product/:productId' element={<Product/>}/>
            {/* 일치하는 라우트가 없는 경우 NotFound.js컴포넌트를 실행 */}
            <Route path='*' element={<NotFound/>}/>
        </Routes><hr/>
        <Footer/>
      </BrowserRouter>
    </div>
  );
}

export default App;
