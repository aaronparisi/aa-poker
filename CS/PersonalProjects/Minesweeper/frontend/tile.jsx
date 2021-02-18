import React from 'react';

export class Tile extends React.Component {
  constructor(props) {
    super(props);  // { tile object, updateGame function }

    this.state = {
      revealed: false,
      flagged: false
    }

    this.tileString = this.tileString.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  tileString() {
    if (this.props.tile.flagged) {
      return ('⚑')
    } else if (this.props.tile.explored) {
      if (this.props.tile.bombed) {
        return ('💣');
      } else if (this.props.tile.adjacentBombCount() > 0){  // how expensive is this?
        return (this.props.tile.adjacentBombCount());
      }
    } else {
      return ('');
    }
  }

  genClassNames() {
    let ret = 'tile';

    if (this.props.tile.flagged) {
      ret += ' flagged';
    }
    if (this.props.tile.cleared) {
      ret += ' cleared';
    }
    if (this.props.tile.bombed) {
      ret += ' bombed';
      if (this.props.tile.clicked) {
        ret += ' tripped';
      }
    }
    if (this.props.tile.explored) {
      ret += ' explored';
    }

    return ret;
  }

  handleClick(e) {
    this.props.updateGame(this.props.tile, e.altKey);
  }

  render() {
    return (
      <div
        className={this.genClassNames()}
        onClick={this.handleClick}>
          {this.tileString()}
      </div>
    )
  }
}