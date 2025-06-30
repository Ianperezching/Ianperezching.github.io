import { useEffect, useState } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game4() {
  const [inputValue, setInputValue] = useState("");
  const [unityMessage, setUnityMessage] = useState<string | null>(null);

  const { unityProvider, sendMessage } = useUnityContext({
    loaderUrl: "Build Nave.loader.js",
    dataUrl: "Build Nave.data",
    frameworkUrl: "Build Nave.framework.js",
    codeUrl: "Build Nave.wasm",
  });

  const handleRestartScene = () => {
    sendMessage("GameController", "ReloadCurrentScene");
  };

  const handleSendTextToUnity = () => {
    if (inputValue.trim() !== "") {
      sendMessage("GameController", "UpdateText", inputValue);
      setInputValue("");
    }
  };

  useEffect(() => {
    (window as any).onUnityMessage = (param: string) => {
      setUnityMessage(param);
      console.log("Mensaje recibido de Unity:", param);
    };
    return () => {
      delete (window as any).onUnityMessage;
    };
  }, []);

  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">Game 4</h1>
        <div style={{ margin: "20px 0" }}>
          <input
            type="text"
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            placeholder="Escribe algo para Unity"
            style={{ padding: "8px", width: "300px" }}
            tabIndex={0}
            autoFocus
          />
          <button
            onClick={handleSendTextToUnity}
            style={{ marginLeft: "10px", padding: "8px 16px" }}
            tabIndex={0}
          >
            Enviar
          </button>
          <button
            onClick={handleRestartScene}
            style={{ marginLeft: "10px", padding: "8px 16px" }}
            tabIndex={0}
          >
            Reset
          </button>
        </div>
        <Unity unityProvider={unityProvider} className="centered-unity" />
        <div style={{ marginTop: "20px", color: "#0f0" }}>
          <strong>Mensaje recibido de Unity:</strong>
          <div>{unityMessage}</div>
        </div>
      </div>
    </div>
  );
}

export default Game4;