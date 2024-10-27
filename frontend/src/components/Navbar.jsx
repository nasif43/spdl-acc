import { h } from 'preact';
import { Link } from 'preact-router';
import logo from '../assets/logo.png';
import '../styles/Navbar.css';

const Navbar = ({ toggleSidebar }) => {
  return (
    <nav className="navbar">
      <button onClick={toggleSidebar} className="logo-button">
        <img src={logo} alt="SPDL" className="logo" />
      </button>
      <h3 style={{ color: '#f0b429' }}>Sarker Properties and Developments Ltd.</h3>
    </nav>
  );
};

export default Navbar;
