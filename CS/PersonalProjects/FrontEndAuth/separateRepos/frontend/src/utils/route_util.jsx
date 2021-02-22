import React from 'react'
import { connect } from 'react-redux'
import { Redirect, Route, withRouter } from 'react-router-dom'

const mapStateToProps = state => {
  return {
    loggedIn: Boolean(state.session.currentUser)
  }
}

// only accessible if NOT logged in, eg. signup and login
const Auth = ({ component: Component, path, loggedIn, exact }) => {
  return (
    <Route path={path} exact={exact} render={(props) => {
      return !loggedIn ? (
        <Component {...props} />
      ) : (
        <Redirect to="/" />
      )
    }}/>
  )
}

// only accessible if logged in, eg. chirps
const Protected = ({ component: Component, path, loggedIn, exact }) => {
  return (
    <Route path={path} exact={exact} render={(props) => {
      return loggedIn ? (
        <Component {...props} />
      ) : (
        <Redirect to="/login" />
      )
    }}/>
  )
}

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth))
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected))