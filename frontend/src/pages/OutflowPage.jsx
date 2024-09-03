import { h } from 'preact';
import DailyBillsCard from '../components/DailyBillsCard';

function OutflowPage({ project_id }) {
  if (!project_id) {
    return <p>Loading...</p>;
  }

  return (
    <div>
      <h1>Outflow for Project {project_id}</h1>
      <DailyBillsCard project_id = {project_id}/>
    </div>
  );
}

export default OutflowPage;
