// src/components/PrivateRoute.jsx
import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import { route } from 'preact-router';

const PrivateRoute = ({ component: Component, ...rest }) => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const token = localStorage.getItem('token');
        if (token) {
            setIsAuthenticated(true);
        } else {
            route('/login'); // Redirect to login if not authenticated
        }
        setLoading(false);
    }, []);

    if (loading) return <div>Loading...</div>;

    return isAuthenticated ? <Component {...rest} /> : null;
};

export default PrivateRoute;
