import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class NavBar extends React.Component {
  constructor({ currentUser, logout }) {
    super({ currentUser, logout })  // ? why am i getting a warning here?

    this.handleLogout = this.handleLogout.bind(this)
  }

  handleLogout() {
    this.props.logout()
    .then(
      () => {
        debugger
        this.props.history.push('/login')
      }
    )
  }

  display() {
    return (this.props.currentUser == null) ? (
      <div>
        <Link className="btn" to="/signup">Sign Up</Link>
        <Link className="btn" to="/login">Log In</Link>
      </div>
    ) : (
      <div>
        <p>Hello, {this.props.currentUser.username}</p>
        <button className="btn" onClick={this.handleLogout}>Log Out</button>
      </div>
    )
  }

  render() {
    return (
      <header className="nav-bar">
        {/* <h1 className="logo">BLUEBIRD</h1> */}
        <Link className="btn" to="/">BLUEBIRD</Link>
        <Link className="btn" to="/chirps">CHIRPS</Link>
        <div>
          {this.display()}
        </div>
      </header>
    );
  }
};

export default withRouter(NavBar)