import React, { useState } from "react";
import { Unity, useUnityContext } from "react-unity-webgl";

function Game5() {
  const { unityProvider, sendMessage } = useUnityContext({
    loaderUrl: "/Build de juego de Fantasmas.loader.js",
    dataUrl: "/Build de juego de Fantasmas.data",
    frameworkUrl: "/Build de juego de Fantasmas.framework.js",
    codeUrl: "/Build de juego de Fantasmas.wasm",
  });

  const [inputValue, setInputValue] = useState("");

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setInputValue(e.target.value);
  };

  const handleSendClick = () => {
    if (inputValue.trim() !== "") {
      sendMessage("GameController", "ReceiveInput", inputValue);
      setInputValue("");
    }
  };

  const handleResetClick = () => {
    sendMessage("GameController", "ReloadScene");
  };

  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">Game 5</h1>
        <div style={{ margin: "20px 0" }}>
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
          <button
            onClick={handleResetClick}
            style={{ marginLeft: "10px", padding: "8px 16px" }}
            tabIndex={0}
          >
            Reset
          </button>
        </div>
        <Unity unityProvider={unityProvider} className="centered-unity" />
      </div>
    </div>
  );
}

export default Game5;