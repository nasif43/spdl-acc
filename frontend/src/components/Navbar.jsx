// src/components/Navbar.jsx
import { h } from 'preact';
import { Link } from 'preact-router';
import logo from '../assets/logo.png'; // Adjust the path if necessary
import '../styles/Navbar.css'; // Assuming you have a CSS file for styling

const handleLogout = () => {
  localStorage.clear();
  window.location.href = '/login';
};
const Navbar = () => {
  return (
    <nav className="navbar">
      <Link href="/">
        <img src={logo} alt="SPDL" className="logo" />
      </Link>
      <h4>Sarker Properties and Development Ltd.</h4>
      <button onClick={handleLogout}>Logout</button>
    </nav>
  );
};

export default Navbar;
