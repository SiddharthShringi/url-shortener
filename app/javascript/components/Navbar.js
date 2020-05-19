import React from "react";
import PropTypes from "prop-types";
class Navbar extends React.Component {
  render() {
    return (
      <React.Fragment>
        <nav className="navbar navbar-light bg-light fixed-top">
          <a className="navbar-brand">Url Shortner</a>
        </nav>
      </React.Fragment>
    );
  }
}

export default Navbar;
