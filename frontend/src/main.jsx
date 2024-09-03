import { h, render } from 'preact';
import App from './app';

document.addEventListener('DOMContentLoaded', () => {
    render(<App />, document.getElementById('root'));
});
