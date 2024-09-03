import { useEffect, useState } from 'preact/hooks';
import { useRouter } from 'preact-router';
import ProjectCard from '../components/ProjectCard';
import ProjectCreateForm from '../components/ProjectCreateForm';
import '../styles/ProjectList.css';

function ProjectList() {
  const router = useRouter();
  const [projects, setProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function fetchProjects() {
      try {
        const response = await fetch('http://103.191.241.13:4000/projects?page=1');
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
            {projects.map((project) => (
              <ProjectCard key={project.id} project={project} />
            ))}
            <ProjectCreateForm/>            
          </div>
        )}
      </div>
    );
}

export default ProjectList;