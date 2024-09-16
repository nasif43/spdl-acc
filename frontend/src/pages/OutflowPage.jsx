import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';
import DailyBillsCard from '../components/DailyBillsCard';

const API_URI = 'http://103.191.241.13:4000';
function OutflowPage({ project_id }) {
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
      <h1>Outflow for {projectName}</h1>
      <DailyBillsCard project_id={project_id} />
    </div>
  );
}

export default OutflowPage;
