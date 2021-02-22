import React from 'react';
import { Link } from 'react-router-dom';

export default ({ currentUser, logout }) => {
  const display = (currentUser == null) ? (
    <div>
      <Link className="btn" to="/signup">Sign Up</Link>
      <Link className="btn" to="/login">Log In</Link>
    </div>
  ) : (
    <div>
      <h2>Welcome, {currentUser.username}</h2>
      <button className="btn" onClick={logout}>Log Out</button>
    </div>
  )

  return (
    <header className="nav-bar">
      <h1 className="logo">BLUEBIRD</h1>
      <div>
        {display}
      </div>
    </header>
  );
};
