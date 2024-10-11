import { h } from 'preact';
import { Router, Route } from 'preact-router';
import Navbar from './components/Navbar';
import ProjectList from './pages/ProjectList';
import ProjectDetail from './pages/ProjectDetail';
import PaymentHistory from './pages/PaymentHistory';
import OutflowPage from './pages/OutflowPage';
import PrivateRoute from './components/PrivateRoute';
import Login from './pages/LoginForm';
import Dashboard from './pages/Dashboard';
function App() {
  return (
    <>
      <Navbar />
      <Router>
        <Route path="/login" component={Login} />
        <PrivateRoute path="/" component={ProjectList} />
        <PrivateRoute path="/projects/:id" component={ProjectDetail} />
        <PrivateRoute path="/payment_history/:project_id/:unitId" component={PaymentHistory} />
        <PrivateRoute path="/projects/:project_id/outflow" component={OutflowPage} />
        <PrivateRoute path="/dashboard" component={Dashboard} />
      </Router>
    </>
  );
}

export default App;
