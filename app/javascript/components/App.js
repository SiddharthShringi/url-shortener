import React from "react";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import Links from "./Links";
import Navbar from "./Navbar";
class App extends React.Component {
  render() {
    return (
      <div className="container mt-6">
        <Links />
      </div>
    );
  }
}

export default App;
