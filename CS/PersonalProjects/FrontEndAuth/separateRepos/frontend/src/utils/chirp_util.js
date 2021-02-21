import axios from 'axios'
import $ from 'jquery'

export const getChirps = () => {
  // return $.ajax({
  //   url: '/api/chirps',
  // })
  return axios({
    method: 'get',
    url: '/api/chirps'
  })
}

export const postLikeToChirp = id => {
  return axios({
    method: 'post',
    url: '/api/likes',
    data: { id },
  })
}

export const deleteLikeFromChirp = id => {
  return axios({
    method: 'delete',
    url: '/api/likes',
    data: { id },
  })
}
