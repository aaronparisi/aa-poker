import React from 'react';
import ReactDOM from 'react-dom';

import { Game } from './frontend/game'

const root = document.getElementById("root");

ReactDOM.render(
  <Game gridSize="9" numBombs="9"/>,
  root
)