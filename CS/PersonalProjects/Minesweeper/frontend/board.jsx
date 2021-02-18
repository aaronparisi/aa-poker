import React from 'react';

import { Tile } from './tile';

export class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <ul className="rows">
        {
          this.props.board.grid.map((row, i) => {
            return (
              <li key={`row-li${i}`}>
                <ul className="row" id={`row${i}`}>
                  {
                    row.map((tile, j) => {
                      return (
                          <li
                          key={`r${i}c${j}`}
                          id={`r${i}c${j}`}>
                            <Tile tile={tile} updateGame={this.props.updateGame}/>
                        </li>
                      );
                    })
                  }
                </ul>
              </li>
            );
          })
        }
      </ul>
    )
  }
}