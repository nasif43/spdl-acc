import { h } from 'preact';
import { Router, Route } from 'preact-router';
import { useState } from 'preact/hooks';
import Navbar from './components/Navbar';
import SideNav from './components/SideNav';
import ProjectList from './pages/ProjectList';
import ProjectDetail from './pages/ProjectDetail';
import PaymentHistory from './pages/PaymentHistory';
import OutflowPage from './pages/OutflowPage';
import PrivateRoute from './components/PrivateRoute';
import Login from './pages/LoginForm';
import Dashboard from './pages/Dashboard';
import InventoryProjects from './pages/InventoryProjects';
import styles from './styles/App.module.css';
import InventoryPage from './pages/InventoryPage';

function App() {
  const [isSidebarOpen, setSidebarOpen] = useState(false);

  const toggleSidebar = () => setSidebarOpen((prev) => !prev);

  return (
    <div className={styles.container}>
      <Navbar toggleSidebar={toggleSidebar} />
      <SideNav isOpen={isSidebarOpen} onToggle={setSidebarOpen} />
      <main className={`${styles.mainContent} ${isSidebarOpen ? styles.sidebarOpen : ''}`}>
        <Router>
          <Route path="/login" component={Login} />
          <PrivateRoute path="/" component={ProjectList} />
          <PrivateRoute path="/projects/:id" component={ProjectDetail} />
          <PrivateRoute path="/payment_history/:project_id/:unitId" component={PaymentHistory} />
          <PrivateRoute path="/projects/:project_id/outflow" component={OutflowPage} />
          <PrivateRoute path="/dashboard" component={Dashboard} />
          <PrivateRoute path="/inventory" component={InventoryProjects} />
          <PrivateRoute path="/inventory/:project_id" component={InventoryPage} />
        </Router>
      </main>
    </div>
  );
}

export default App;
