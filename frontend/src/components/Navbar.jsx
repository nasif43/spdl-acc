// src/components/Navbar.jsx
import { h } from 'preact';
import { Link } from 'preact-router';
import logo from '../assets/logo.png'; // Adjust the path if necessary
import '../styles/Navbar.css'; // Assuming you have a CSS file for styling

const Navbar = () => {
  return (
    <nav className="navbar">
      <Link href="/">
        <img src={logo} alt="SPDL" className="logo" />
      </Link>
      <h4>SPDL Construction and Client Billing App</h4>
      
    </nav>
  );
};

export default Navbar;
