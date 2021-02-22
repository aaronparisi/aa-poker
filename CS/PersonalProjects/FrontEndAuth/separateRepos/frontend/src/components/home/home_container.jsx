import React from 'react'
import { connect } from 'react-redux'
import Home from './home'
import { fetchCurrentUser } from '../../actions/session_actions'

// no state

const mapDispatchToProps = dispatch => {
  return {
    fetchCurrentUser: () => dispatch(fetchCurrentUser()),
  }
}

export default connect(null, mapDispatchToProps)(Home)