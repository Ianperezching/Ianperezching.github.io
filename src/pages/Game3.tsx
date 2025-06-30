import React, { useState } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game3() {
  const { unityProvider, sendMessage } = useUnityContext({
    loaderUrl: "/Build de colores.loader.js",
    dataUrl: "/Build de colores.data",
    frameworkUrl: "/Build de colores.framework.js",
    codeUrl: "/Build de colores.wasm",
  });

  const [inputValue, setInputValue] = useState("");

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInputValue(e.target.value);
  };

  const handleSendClick = () => {
    if (inputValue.trim() !== "") {
      // Cambia "GameManager" y "ReceiveInput" por los nombres correctos en tu Unity
      sendMessage("GameController", "UpdateText", inputValue);
      setInputValue("");
    }
  };

  function handleSceneRestart() {
    sendMessage("GameController", "ReloadCurrentScene");
  }

  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">Game 3</h1>
        {/* Input y botón fuera del canvas de Unity */}
        <div style={{ margin: "20px 0", zIndex: 2, position: "relative" }}>
          <input
            type="text"
            value={inputValue}
            onChange={handleInputChange}
            placeholder="Escribe aquí..."
            style={{ padding: "8px", width: "300px" }}
            tabIndex={0}
            autoFocus
          />
          <button
            onClick={handleSendClick}
            style={{ marginLeft: "10px", padding: "8px 16px" }}
            tabIndex={0}
          >
            Enviar
          </button>
        </div>
        <Unity unityProvider={unityProvider} className="centered-unity" />
        <button onClick={handleSceneRestart}>Restart</button>
      </div>
    </div>
  );
}

export default Game3;