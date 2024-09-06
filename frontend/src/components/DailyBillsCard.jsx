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
  const [labours, setLabours] = useState(0);
  const [due, setDue] = useState(0);
  const [paid, setPaid] = useState(0);
  const [note, setNote] = useState('');
  const [editId, setEditId] = useState(null); // For editing
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  // Fetch bills on button click
  const fetchBills = () => {
    setLoading(true);
    const token = localStorage.getItem('token');
    fetch(`${API_URI}/daily_billings/${project_id}`, {
      headers: {
        'Authorization': `Bearer ${token}`,
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
        setShowTable(true);
        setShowForm(false);
      })
      .catch(err => {
        console.error('Failed to fetch bills:', err);
        setError('Failed to fetch bills.');
        setLoading(false);
      });
  };

  const handleAddOrUpdateBill = (e) => {
    e.preventDefault();
    const billData = {
      project_id: project_id,
      unfront_cost: upFrontCost,
      date,
      description,
      labours: parseInt(labours),
      due: parseFloat(due),
      paid: parseFloat(paid),
      note
    };

    const token = localStorage.getItem('token');
    if (!token) {
      setError('No token found. Please log in again.');
      return;
    }

    const url = editId ? `${API_URI}/daily_billings/${editId}` : `${API_URI}/daily_billings/`;
    const method = editId ? 'PUT' : 'POST';

    fetch(url, {
      method: method,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`,
      },
      body: JSON.stringify(billData),
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('Failed to add or update bill');
        }
        return response.json();
      })
      .then(data => {
        if (editId) {
          setBills(bills.map(bill => (bill.id === editId ? data : bill)));
        } else {
          setBills([...bills, data]);
        }
        resetForm();
      })
      .catch(err => {
        console.error('Error adding or updating bill:', err);
        setError('Failed to add or update bill. Please try again.');
      });
  };

  const handleDeleteBill = (id) => {
    const token = localStorage.getItem('token');
    if (!token) {
      setError('No token found. Please log in again.');
      return;
    }

    if (confirm('Are you sure you want to delete this bill?')) {
      fetch(`${API_URI}/daily_billings/${id}`, {
        method: 'DELETE',
        headers: {
          'Authorization': `Bearer ${token}`,
        },
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('Failed to delete bill');
          }
          setBills(bills.filter(bill => bill.id !== id));
        })
        .catch(err => {
          console.error('Error deleting bill:', err);
          setError('Failed to delete bill. Please try again.');
        });
    }
  };

  const handleEditBill = (bill) => {
    setEditId(bill.id);
    setUpFrontCost(bill.unfront_cost);
    setDate(bill.date);
    setDescription(bill.description);
    setLabours(bill.labours);
    setDue(bill.due);
    setPaid(bill.paid);
    setNote(bill.note);
    setShowForm(true);
    setShowTable(false);
  };

  const resetForm = () => {
    setEditId(null);
    setUpFrontCost(false);
    setDate('');
    setDescription('');
    setLabours(0);
    setDue(0);
    setPaid(0);
    setNote('');
    setShowForm(false);
    setShowTable(true);
    setError('');
  };

  return (
    <div className="daily-bills-card">
      <button onClick={() => { setShowForm(false); setShowTable(true); fetchBills(); }}>View Bills</button>
      <button onClick={() => { resetForm(); setShowForm(true); setShowTable(false); }}>Add Bill</button>

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
              <th>Actions</th> {/* Add an actions column */}
            </tr>
          </thead>
          <tbody>
            {bills.length === 0 ? (
              <tr>
                <td colSpan="8">No bills available for this project.</td>
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
                  <td>
                    {/* <button onClick={() => handleEditBill(bill)}>Edit</button> */}
                    <button onClick={() => handleDeleteBill(bill.id)}>Delete</button>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      )}

      {showForm && (
        <form onSubmit={handleAddOrUpdateBill}>
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
          <button type="submit">{editId ? 'Update Bill' : 'Submit Bill'}</button>
          <button type="button" onClick={resetForm}>Cancel</button>
        </form>
      )}
    </div>
  );
}

export default DailyBillsCard;
