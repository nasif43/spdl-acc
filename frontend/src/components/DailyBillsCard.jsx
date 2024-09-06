import { h } from 'preact';
import { useState } from 'preact/hooks';
import '../styles/Table.css'; // Assuming you have some basic styles for the table

const API_URI = process.env.REACT_APP_API_URL || 'http://localhost:4000';

function DailyBillsCard({ project_id }) {
  const [bills, setBills] = useState([]);
  const [showForm, setShowForm] = useState(false);
  const [showTable, setShowTable] = useState(false);
  const [upFrontCost, setUpFrontCost] = useState(false);
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const [labours, setLabours] = useState(0); // Initialize to 0 for numeric input
  const [due, setDue] = useState(0); // Due is Bill in database
  const [paid, setPaid] = useState(0); // Initialize to 0 for numeric input
  const [note, setNote] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  // Fetch bills on button click
  const fetchBills = () => {
    setLoading(true);
    const token = localStorage.getItem('token'); // Retrieve the token
    fetch(`${API_URI}/daily_billings/${project_id}`, {
      headers: {
        'Authorization': `Bearer ${token}`, // Include the token
      },
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('Failed to fetch bills');
        }
        return response.json();
      })
      .then(data => {
        setBills(data);
        setLoading(false);
        setShowTable(true); // Show the table when data is fetched
        setShowForm(false); // Hide the form when showing the table
      })
      .catch(err => {
        console.error('Failed to fetch bills:', err);
        setError('Failed to fetch bills.');
        setLoading(false);
      });
  };

  const handleAddBill = (e) => {
    e.preventDefault();
    const newBill = {
      project_id: project_id,
      unfront_cost: upFrontCost, // Assuming this is a boolean value
      date,
      description,
      labours: parseInt(labours), // Ensure labours is a number
      due: parseFloat(due),
      paid: parseFloat(paid), // Ensure paid is a number
      note
    };

    const token = localStorage.getItem('token'); // Retrieve the token
    console.log('Token:', token); // Debugging line
    if (!token) {
      setError('No token found. Please log in again.');
      return;
    }

    fetch(`${API_URI}/daily_billings/`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`, // Include the token
      },
      body: JSON.stringify(newBill),
    })
      .then(response => {
        if (!response.ok) {
          console.error('Failed response:', response); // Debugging line
          throw new Error('Failed to add bill');
        }
        return response.json();
      })
      .then(data => {
        setBills([...bills, data]); // Add the new bill to the existing list
        setShowForm(false); // Hide the form after submission
        setShowTable(true); // Show the table after adding a bill
        setUpFrontCost(false); // Reset upfront cost after submission
        setDate('');
        setDescription('');
        setDue('');
        setPaid(0); // Reset paid to 0 after submission
        setError('');
      })
      .catch(err => {
        console.error('Error adding bill:', err);
        setError('Failed to add bill. Please try again.');
      });
  };

  return (
    <div className="daily-bills-card">
      <button onClick={() => { setShowForm(false); setShowTable(true); fetchBills(); }}>View Bills</button>
      <button onClick={() => { setShowForm(true); setShowTable(false); }}>Add Bill</button>

      {error && <div className="error">{error}</div>}
      {loading && <div>Loading...</div>}

      {showTable && !loading && (
        <table>
          <thead>
            <tr>
              <th>Project ID</th>
              <th>Date</th>
              <th>Description (বিবরণ)</th>
              <th>Labours (শ্রমিক সংখ্যা)</th>
              <th>Bill</th>
              <th>Paid</th>
              <th>Note</th>
            </tr>
          </thead>
          <tbody>
            {bills.length === 0 ? (
              <tr>
                <td colSpan="7">No bills available for this project.</td>
              </tr>
            ) : (
              bills.map(bill => (
                <tr key={bill.id}>
                  <td>{bill.project_id}</td>
                  <td>{bill.date}</td>
                  <td>{bill.description}</td>
                  <td>{bill.labours}</td>
                  <td>{bill.due}</td>
                  <td>{bill.paid}</td>
                  <td>{bill.note}</td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      )}

      {showForm && (
        <form onSubmit={handleAddBill}>
          {/* <label>
            Upfront Cost:
            <input
              type="checkbox"
              checked={upFrontCost}
              onChange={(e) => setUpFrontCost(e.target.checked)}
            />
          </label> */}
          <label>
            Date:
            <input type="date" value={date} onChange={(e) => setDate(e.target.value)} required />
          </label>
          <label>
            Description (বিবরণ):
            <input type="text" value={description} onChange={(e) => setDescription(e.target.value)} required />
          </label>
          <label>
            Labours (শ্রমিক সংখ্যা):
            <input type="number" value={labours} onChange={(e) => setLabours(e.target.value)} />
          </label>
          <label>
            Bill Amount:
            <input type="number" value={due} onChange={(e) => setDue(e.target.value)} required />
          </label>
          <label>
            Paid:
            <input type="number" value={paid} onChange={(e) => setPaid(e.target.value)} required />
          </label>
          <label>
            Note:
            <textarea value={note} onChange={(e) => setNote(e.target.value)} />
          </label>
          <button type="submit">Submit Bill</button>
        </form>
      )}
    </div>
  );
}

export default DailyBillsCard;
