import { Link } from "react-router-dom"

function MainNav() {
    return (
        <nav className="navbar navbar-expand-lg bg-body-tertiary sticky-top bg-dark navbar-dark">
            <div className="container">
                <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link" to="/">Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/login">Login</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/register">Registrarse</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/game">Game</Link>
                        </li> 
                        <li className="nav-item">
                            <Link className="nav-link" to="/game2">Game2</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/game3">Game3</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/game4">Game4</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/game5">Game5</Link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    )
}

export default MainNav