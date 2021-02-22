import React from 'react';
import '../stylesheets/App.css';

import NavBarContainer from './nav_bar/nav_bar_container'
import ChirpIndexContainer from './chirps/chirp_index_container'
import SignupContainer from './session/signup_container'
import LoginContainer from './session/login_container'
import Home from './home/home'

import { Route } from 'react-router-dom'

function App() {
  return (
    <div>
      <Route path="/" component={NavBarContainer} />
      <Route exact path="/" component={Home} />
      <Route path="/chirps" component={ChirpIndexContainer} />
      <Route exact path="/signup" component={SignupContainer} />
      <Route exact path="/login" component={LoginContainer} />
    </div>
  )
}

export default App;
