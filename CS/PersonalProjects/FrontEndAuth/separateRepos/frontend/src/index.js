import React from 'react';
import ReactDOM from 'react-dom';
import './stylesheets/index.css';
import AppContainer from './components/app/app_container';
import createStore from './store/store';
import { Provider } from 'react-redux';
import { Router } from 'react-router';
import { createBrowserHistory } from 'history'

import { fetchCurrentUser } from './actions/session_actions'

const axios = require('axios').default
if (process.env.NODE_ENV === "production") {
  // ! change this when you deploy
  axios.defaults.baseURL = 'http://some-heroku-url.com'
} else {
  axios.defaults.baseURL = 'http://localhost:3000'
  axios.defaults.withCredentials = true
}

const store = createStore()
export const history = createBrowserHistory()

fetchCurrentUser()(store.dispatch)
.then(
  msg => {
    ReactDOM.render(
      <React.StrictMode>
        <Provider store={store}>
          <Router history={history}>
            <AppContainer />
          </Router>
        </Provider>
      </React.StrictMode>,
      document.getElementById('root')
    )
  },
  err => {
    console.log('error fetching current user')
  }
)
