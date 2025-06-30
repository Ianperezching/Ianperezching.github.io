import { BrowserRouter, Route, Routes } from 'react-router-dom'
import './App.css'
import Home from "./pages/Home.tsx";
import MainHeader from "./common/MainHeader.tsx";
import MainNav from "./common/MainNav.tsx";
import MainFooter from "./common/MainFooter.tsx";
import Game from "./pages/Game.tsx";
import Game2 from "./pages/Game2.tsx";
import Game3 from "./pages/Game3.tsx";
import Game4 from "./pages/Game4.tsx";
import Game5 from "./pages/Game5.tsx";
import Login from "./pages/Login";
import Register from "./pages/Register";


function App() {
    return (
        <>
            <BrowserRouter>
                <MainHeader />
                <MainNav />
                <Routes>
                    <Route path='/' element={<Home/>}/>
                    <Route path='/login' element={<Login/>}/>
                    <Route path='/register' element={<Register/>}/>
                    <Route path='/game' element={<Game/>}/>
                    <Route path='/game2' element={<Game2/>}/>
                    <Route path='/game3' element={<Game3/>}/>
                    <Route path='/game4' element={<Game4/>}/>
                    <Route path='/game5' element={<Game5/>}/>
                </Routes>
                <MainFooter />
            </BrowserRouter>

        </>
    );
}


export default App
