import React from 'react';
import birdHero from '../../images/bird-hero.jpg'

export default () => (
  <div className="home">
    <div className="hero-img-frame">
      <img className="hero-img" src={birdHero} />
    </div> 
    <h1>Where birds can chirp.</h1>
  </div>
)
