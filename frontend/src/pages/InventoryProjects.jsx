import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';
import { Link } from 'preact-router';
import '../styles/ProjectList.css';

const API_URI = 'http://103.191.241.13:4000';
const forbidden_project_ids = [4,5,6];

function InventoryProjects() {
    const [projects, setProjects] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const [userRole, setUserRole] = useState('');

    useEffect(() => {
        setUserRole(localStorage.getItem('userRole') || '');
        async function fetchProjects() {
            try {
                const response = await fetch(`${API_URI}/projects?page=1`);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data = await response.json();
                setProjects(data);
            } catch (error) {
                setError(error.message);
            } finally {
                setLoading(false);
            }
        }

        fetchProjects();
    }, []);

    if (loading) return <div>Loading...</div>;
    if (error) return <div>Error: {error}</div>;

    return (
        <div className="project-list">
            {projects.length === 0 ? (
                <div>No projects available</div>
            ) : (
                <div className="project-card-container">
                    {projects
                        .filter((project) => !forbidden_project_ids.includes(project.id))
                        .map((project) => (
                            <div key={project.id} className="project-card">
                                <h2>{project.name}</h2>
                                <p>{project.id}</p>
                                <p>Location: {project.location}</p>
                                <p>Start Date: {project.start_date}</p>
                                <p>Status: {project.status}</p>
                                <Link href={`/inventory/${project.id}`}>
                                    <button>Warehouse</button>
                                </Link>
                            </div>
                        ))}
                </div>
            )}
        </div>
    );
}

export default InventoryProjects;