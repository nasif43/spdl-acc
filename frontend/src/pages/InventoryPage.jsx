import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';
import InventoryCard from '../components/InventoryCard';

const API_URI = 'http://103.191.241.13:4000';
const forbidden_project_ids = [4,5,6];

function InventoryPage({ project_id }) {
    const [projectName, setProjectName] = useState('');

    useEffect(() => {
        if (project_id) {
            fetchProjectName();
        }
    }, [project_id]);

    // Fetch the project name based on the project ID
    const fetchProjectName = () => {
        const token = localStorage.getItem('token');
        fetch(`${API_URI}/projects/${project_id}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        })
            .then(response => response.json())
            .then(data => {
                setProjectName(data.name || `Project ${project_id}`);
            })
            .catch(err => {
                console.error('Failed to fetch project name:', err);
            });
    };

    if (!project_id) {
        return <p>Loading...</p>;
    }

    return (
        <div>
            <h1>Inventory for {projectName}</h1>
            <InventoryCard project_id={project_id} />
        </div>
    );
}

export default InventoryPage;