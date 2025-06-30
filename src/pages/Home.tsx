import MainBanner from "../common/MainBanner.tsx";
import Foto from '../assets/images/Foto.png';

function Home() {

    return (
        <div>
            <MainBanner />
            <section style={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'center',
                textAlign: 'center',
                backgroundColor: '#f0f8ff',
                padding: '20px',
                borderRadius: '10px',
                marginTop: '20px'
            }}>
                <img 
                    src={Foto} 
                    alt="Mi foto" 
                    style={{
                        borderRadius: '50%',
                        width: '150px',
                        height: '150px',
                        marginBottom: '15px'
                    }}
                />
                <h2 style={{ color: '#333' }}>Sobre mí</h2>
                <p style={{ color: '#555', fontSize: '18px' }}>
                    <strong>Nombre:</strong> Ian Marcelo Pérez<br />
                    <strong>Edad:</strong> 21 años<br />
                    <strong>Carrera:</strong> Diseño y desarrollo de videojuegos<br />
                </p>
            </section>
        </div>
    );
}


export default Home