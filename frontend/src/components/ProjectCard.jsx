import { h } from 'preact';
import { Link } from 'preact-router';

function ProjectCard({ project }) {
  return (
    <div className="project-card">
      <h2>{project.name}</h2>
      <p>{project.id}</p>
      <p>Location: {project.location}</p>
      <p>Start Date: {project.start_date}</p>
      <p>Status: {project.status}</p>
      <Link href={`/projects/${project.id}`}><button style={'margin-right : 5px'}>Inflow: {/* Dynamically calculate inflow */}</button></Link>
      <Link href={`/projects/${project.id}/outflow`}><button style={'margin-left : 5px'}>Outflow: {/* Dynamically calculate outflow */}</button></Link>
    </div>
  );
}

export default ProjectCard;
