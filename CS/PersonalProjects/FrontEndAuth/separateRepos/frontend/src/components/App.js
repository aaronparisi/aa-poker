import React from 'react';
import '../stylesheets/App.css';

import NavBarContainer from './nav_bar/nav_bar_container'
import ChirpIndexContainer from './chirps/chirp_index_container'
import Home from './home/home'

import { Route } from 'react-router-dom'

function App() {
  return (
    <div>
      <Route path="/" component={NavBarContainer} />
      <Route exact path="/" component={Home} />
      <Route path="/chirps" component={ChirpIndexContainer} />
    </div>
  )
}

export default App;
