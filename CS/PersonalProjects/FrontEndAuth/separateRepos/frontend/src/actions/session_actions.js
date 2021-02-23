import * as sessionApiUtil from '../utils/session_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER'

export const receiveCurrentUser = user => {
  return {
    type: RECEIVE_CURRENT_USER,
    user
  }
}

const logoutCurrentUser = () => {
  return {
    type: LOGOUT_CURRENT_USER
  }
}

// thunk stuff - will be exported to containers

export const createNewUser = formUser => dispatch => {
  return sessionApiUtil.postUser(formUser)
  .then(
    newUser => {
      dispatch(receiveCurrentUser(newUser.data))
      return newUser
    },
    err => {
      return Promise.reject(err)
    }
  )
}

export const login = formUser => dispatch => {
  return sessionApiUtil.postSession(formUser)
  .then(
    curUser => {
      dispatch(receiveCurrentUser(curUser.data))
      return curUser
    },
    err => {
      return Promise.reject(err)
    }
  )
}

export const logout = () => dispatch => {
  return sessionApiUtil.deleteSession()
  .then(
    logoutMsg => {  // does the msg from sessions controller even get returned?
      dispatch(logoutCurrentUser())
    },
    err => {
      console.log(err)
    }
  )
}

export const fetchCurrentUser = () => dispatch => {
  return sessionApiUtil.getCurrentUser()
  .then(
    currentUser => {
      if (currentUser.data !== '') {
        dispatch(receiveCurrentUser(currentUser.data))
      }
      return currentUser
    },
    err => {
      console.log('error fetching current user')
    }
  )
}