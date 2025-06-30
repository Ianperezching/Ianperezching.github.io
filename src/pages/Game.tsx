import {Unity, useUnityContext} from "react-unity-webgl";

function Game() {
    const { unityProvider, sendMessage } = useUnityContext({
        loaderUrl: "/BuildVerdadero.loader.js",
        dataUrl: "/BuildVerdadero.data",
        frameworkUrl: "/BuildVerdadero.framework.js",
        codeUrl: "/BuildVerdadero.wasm",
    });

    function HandelSceneRestart() {
        sendMessage("MenuManager", "ReloadScene");
    }


    return (
        <>
            <div className="centered-container">
                <div className="centered-content">
                    <h1 className="centered-title">React + Unity / Tecsup</h1>
                    <Unity unityProvider={unityProvider} className="centered-unity" />

                    <div className="centered-content">
                        <button onClick={HandelSceneRestart}>Restart</button>
                    </div>

                </div>
            </div>

        </>
    );
}


export default Game