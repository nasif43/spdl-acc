import { h } from 'preact'; 
import { useState, useEffect } from 'preact/hooks';
import { Link } from 'preact-router';
import { LogOut, LucideLayoutDashboard, GaugeCircle, Package } from 'lucide-preact';
import styles from '../styles/SideNav.module.css';

const menuItems = [
  { icon: GaugeCircle, text: 'Dashboard', href: '/dashboard' },
  { icon: LucideLayoutDashboard, text: 'All Projects', href: '/' },
  { icon: Package, text: 'Inventory', href: '/inventory' }, // Added inventory menu item
];

const handleLogout = () => {
  localStorage.clear();
  window.location.href = '/login';
};

export default function SideNav({ isOpen, onToggle }) {
  const [open, setOpen] = useState(isOpen);

  useEffect(() => {
    setOpen(isOpen);
  }, [isOpen]);

  return (
    <nav className={`${styles.sidenav} ${open ? styles.open : ''}`}>
      <ul className={styles.menu}>
        {menuItems.map(({ icon: Icon, text, href }) => (
          <li key={href}>
            <Link
              href={href}
              className={`${styles.menuItem} ${window.location.pathname === href ? styles.active : ''}`}
            >
              <Icon size={24} />
              {open && <span>{text}</span>}
            </Link>
          </li>
        ))}
      </ul>
      <button className={styles.logout} onClick={handleLogout}>
        <LogOut size={24} />
        {open && <span>Logout</span>}
      </button>
    </nav>
  );
}
