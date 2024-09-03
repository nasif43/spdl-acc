import { h } from 'preact';
import { useState } from 'preact/hooks';
import '../styles/LoginForm.css';

const LoginForm = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');

    const handleSubmit = async (event) => {
        event.preventDefault();
        try {
            const response = await fetch('http://103.191.241.13:4000/token', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    username,
                    password,
                }),
            });
            if (response.ok) {
                const data = await response.json();
                localStorage.setItem('token', data.access_token); // Save token in local storage
                window.location.href = '/'; // Redirect after successful login
            } else {
                setError('Invalid username or password');
            }
        } catch (error) {
            setError('Error occurred during login');
        }
    };

    return (
        <div className="login-card">
            <h2>Login</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Username:
                    <input
                        type="text"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        required
                    />
                </label>
                <label>
                    Password:
                    <input
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                    />
                </label>
                <button type="submit">Login</button>
            </form>
            {error && <div className="error-message">{error}</div>}
        </div>
    );
};

export default LoginForm;
