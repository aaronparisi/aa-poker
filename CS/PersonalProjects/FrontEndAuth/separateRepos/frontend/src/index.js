import React from 'react';
import ReactDOM from 'react-dom';
import './stylesheets/index.css';
import App from './components/App';
import createStore from './store/store';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';

const axios = require('axios').default
if (process.env.NODE_ENV === "production") {
  // ! change this when you deploy
  axios.defaults.baseURL = 'http://localhost:3000'
} else {
  axios.defaults.baseURL = 'http://localhost:3000'
}

const store = createStore()

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <HashRouter>
        <App />
      </HashRouter>
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);