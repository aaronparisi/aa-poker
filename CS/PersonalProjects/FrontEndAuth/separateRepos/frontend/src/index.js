import React from 'react';
import ReactDOM from 'react-dom';
import './stylesheets/index.css';
import AppContainer from './components/app/app_container';
import createStore from './store/store';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';

const axios = require('axios').default
if (process.env.NODE_ENV === "production") {
  // ! change this when you deploy
  axios.defaults.baseURL = 'http://some-heroku-url.com'
} else {
  axios.defaults.baseURL = 'http://localhost:3000'
  axios.defaults.withCredentials = true
}

const store = createStore()

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <HashRouter>
        <AppContainer />
      </HashRouter>
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);