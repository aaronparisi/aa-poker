import axios from "axios"

export const getCurrentUser = () => {
  return axios({
    method: 'get',
    url: '/api/users/current-user'
  })
}

// create a new user
export const postUser = user => {
  return axios({
    method: 'post',
    url: '/api/users',
    data: { user }
  })
}

// log a user in (create a session)
export const postSession = user => {
  return axios({
    method: 'post',
    url: '/api/session',
    data: { user }
  })
}

// log out a user (delete a session)
export const deleteSession = () => {
  return axios({
    method: 'delete',
    url: '/api/session'
  })
}