import React from "react";

function Game2() {
  return (
    <div className="centered-container">
      <div className="centered-content">
        <h1 className="centered-title">Game 2</h1>
        <iframe
          src="/index.html"
          width="800"
          height="600"
          style={{ border: "none" }}
          title="Construct 2 Game"
        ></iframe>
      </div>
    </div>
  );
}

export default Game2;