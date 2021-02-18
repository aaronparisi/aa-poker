import React from 'react';

// game logic
import * as Minesweeper from '../game-logic/minesweeper.js';

//react components
import { Board } from './board';

export class Game extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      board: new Minesweeper.Board(props.gridSize, props.numBombs)
    }

    this.updateGame = this.updateGame.bind(this);
    this.reset = this.reset.bind(this);
    this.buildModal = this.buildModal.bind(this);
  }

  updateGame(tile, isFlagging) {
    // doesn't do anything get
    if (isFlagging) {
      tile.toggleFlag();
    } else {
      tile.explore(true);
    }

    this.setState({ board: this.state.board });
  }

  reset() {
    this.setState({ board: new Minesweeper.Board(this.state.board.gridSize, this.state.board.numBombs)})
  }

  buildModal(text) {
    return (
      <div className="modal">
        <div className="modal-contents">
          <div className="modal-text">{text}</div>
          <button className="modal-button" onClick={this.reset}>Play Again</button>
        </div>
      </div>
    )
  }

  render() {
    let modal;

    if (this.state.board.lost()) {
      this.state.board.showYourself()
      modal = this.buildModal('You lost')
    } else if (this.state.board.won()) {
      this.state.board.showYourself()
      modal = this.buildModal('You won')
    }

    return (
      <div className="game">
        {modal}
        <div className="board">{<Board board={this.state.board} updateGame={this.updateGame}/>}</div>
      </div>
    )
  }
}