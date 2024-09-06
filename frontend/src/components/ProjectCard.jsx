import { h } from 'preact';
import { useState } from 'preact/hooks';
import { Link } from 'preact-router';
import '../styles/ProjectCard.css'; // Add your styles here

const API_URI = process.env.REACT_APP_API_URL || 'http://localhost:4000';

function ProjectCard({ project, onDelete }) {
  const [isEditing, setIsEditing] = useState(false);
  const [showEditDelete, setShowEditDelete] = useState(false);
  const [name, setName] = useState(project.name);
  const [location, setLocation] = useState(project.location);
  const [startDate, setStartDate] = useState(project.start_date);
  const [status, setStatus] = useState(project.status);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleToggle = () => {
    setShowEditDelete(!showEditDelete);
  };

  const handleEdit = () => {
    setIsEditing(true);
  };

  const handleClose = () => {
    setIsEditing(false);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setLoading(true);

    const updatedProject = {
      name,
      location,
      start_date: startDate,
      status
    };

    fetch(`${API_URI}/projects/${project.id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(updatedProject)
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('Failed to update project');
        }
        return response.json();
      })
      .then(data => {
        alert('Project updated successfully!');
        setIsEditing(false); // Close modal on success
        setLoading(false);
      })
      .catch(err => {
        console.error('Error updating project:', err);
        setError('Failed to update project.');
        setLoading(false);
      });
  };

  const handleDelete = () => {
    if (confirm('Are you sure you want to delete this project?')) {
      setLoading(true);

      fetch(`${API_URI}/projects/${project.id}`, {
        method: 'DELETE',
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('Failed to delete project');
          }
          return response.json();
        })
        .then(() => {
          alert('Project deleted successfully!');
          onDelete(project.id); // Notify parent component to update the list
          setLoading(false);
        })
        .catch(err => {
          console.error('Error deleting project:', err);
          setError('Failed to delete project.');
          setLoading(false);
        });
    }
  };

  // Dummy functions for inflow and outflow calculations
  const calculateInflow = () => {
    // Replace this with actual logic to calculate inflow
    return "৳0";
  };

  const calculateOutflow = () => {
    // Replace this with actual logic to calculate outflow
    return "৳0";
  };

  return (
    <div className="project-card">
      <h2>{project.name}</h2>
      <p>{project.id}</p>
      <p>Location: {project.location}</p>
      <p>Start Date: {project.start_date}</p>
      <p>Status: {project.status}</p>
      
      <button onClick={handleToggle} style={{ marginRight: '10px'}}>
        {showEditDelete ? 'Inflow/Outflow' : 'Edit/Delete'}
      </button>

      {showEditDelete ? (
        <>
          <button onClick={handleEdit} style={{ marginRight: '5px' }}>Edit</button>
          <button onClick={handleDelete} style={{ marginLeft: '5px' }}>Delete</button>
        </>
      ) : (
        <>
          <Link href={`/projects/${project.id}`}><button style={{ marginRight: '5px' }}>Inflow: {calculateInflow()}</button></Link>
          <Link href={`/projects/${project.id}/outflow`}><button style={{ marginLeft: '5px' }}>Outflow: {calculateOutflow()}</button></Link>
        </>
      )}

      {/* Edit Modal */}
      {isEditing && (
        <div className="modal">
          <div className="modal-content">
            <span className="close" onClick={handleClose}>&times;</span>
            <h2>Edit Project</h2>
            {error && <div className="error">{error}</div>}
            {loading && <div>Loading...</div>}
            <form onSubmit={handleSubmit}>
              <label>
                Name:
                <input type="text" value={name} onChange={(e) => setName(e.target.value)} required />
              </label>
              <label>
                Location:
                <input type="text" value={location} onChange={(e) => setLocation(e.target.value)} required />
              </label>
              <label>
                Start Date:
                <input type="date" value={startDate} onChange={(e) => setStartDate(e.target.value)} required />
              </label>
              <label>
                Status:
                <input type="text" value={status} onChange={(e) => setStatus(e.target.value)} required />
              </label>
              <button type="submit">Update Project</button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}

export default ProjectCard;
