import { useState, useEffect } from 'preact/hooks';
import { fetchDailyBillings } from '../utils/api'; // Adjust this path as necessary
import DailyBillsCard from '../components/DailyBillsCard';
import '../styles/SEDashboard.css';

const SEdashboard = () => {
  const [dailyBillings, setDailyBillings] = useState([]);

  useEffect(() => {
    const loadBillings = async () => {
      try {
        const response = await fetchDailyBillings();
        setDailyBillings(response);
      } catch (error) {
        console.error('Error fetching daily billings:', error);
      }
    };

    loadBillings();
  }, []);

  return (
    <div>
      <h1>Site Engineer Dashboard</h1>
      <div>
        {dailyBillings.map(billing => (
          <DailyBillsCard key={billing.id} billing={billing} />
        ))}
      </div>
      <button onClick={() => {/* Add logic to add new bills */}}>Add New Billing</button>
    </div>
  );
};

export default SEdashboard;
