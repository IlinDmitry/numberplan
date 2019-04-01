import React, { Component } from 'react';
import './App.css';
import Numberplan from './components/NumberplanContainer'

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
        <Numberplan/>
        </header>
      </div>
    );
  }
}

export default App;
