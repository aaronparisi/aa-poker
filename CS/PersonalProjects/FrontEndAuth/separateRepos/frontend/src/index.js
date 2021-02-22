import React from 'react';
import ReactDOM from 'react-dom';
import './stylesheets/index.css';
import App from './components/App';
import createStore from './store/store';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';
import { receiveCurrentUser } from './actions/session_actions';
import { getCurrentUser } from './utils/session_util'

const axios = require('axios').default
if (process.env.NODE_ENV === "production") {
  // ! change this when you deploy
  axios.defaults.baseURL = 'http://some-heroku-url.com'
} else {
  axios.defaults.baseURL = 'http://localhost:3000'
  axios.defaults.withCredentials = true
}

const store = createStore()

const fetchCurrentUser = () => {
  getCurrentUser()
  .then(
    currentUser => {
      if (currentUser.data !== '') {
        store.dispatch(receiveCurrentUser(currentUser.data))
      }
    },
    err => {
      console.log('error fetching current user')
    }
  )
}

window.addEventListener('DOMContentLoaded', e => {
  fetchCurrentUser();
})

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