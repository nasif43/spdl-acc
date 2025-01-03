import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';
import '../styles/Table.css'; // Assuming you have some basic styles for the table
import { BILL_DESCRIPTIONS } from '../constants';

const API_URI = 'http://103.191.241.13:4000';

function DailyBillsCard({ project_id }) {
  const [bills, setBills] = useState([]);
  const [showForm, setShowForm] = useState(false);
  const [showTable, setShowTable] = useState(false);
  const [upFrontCost, setUpFrontCost] = useState(false);
  const [date, setDate] = useState('');
  const [description, setDescription] = useState('');
  const [labour, setLabour] = useState(0);
  const [due, setDue] = useState(0);
  const [paid, setPaid] = useState(0);
  const [note, setNote] = useState('');
  const [user_id, setUserId] = useState(0);
  // Date filter states
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');
  const [descriptionFiler, setDescriptionFilter] = useState('');
  const [noteFilter, setNoteFilter] = useState(''); // Add state for note filter
  const [editId, setEditId] = useState(null);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  // Total bill amount
  const [totalBill, setTotalBill] = useState(0);
  const [totalPaid, setTotalPaid] = useState(0);
  const [totalDue, setTotalDue] = useState(0);
  const [userRole, setUserRole] = useState('');

  useEffect(() => {
    setUserRole(localStorage.getItem('userRole') || '');
    const totalBillAmount = bills.reduce((total, bill) => total + bill.due, 0);
    const totalPaidAmount = bills.reduce((total, bill) => total + bill.paid, 0);
    const totalDueAmount = totalBillAmount - totalPaidAmount;
    setTotalBill(totalBillAmount);
    setTotalPaid(totalPaidAmount);
    setTotalDue(totalDueAmount);
  }, [bills]);

  // Fetch bills on button click
  const fetchBills = () => {
    setLoading(true);
    const token = localStorage.getItem('token');
    ;
    // Fetch all bills without filtering by date on the server side
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
        // Apply client-side filtering based on date range and note filter
        const filteredData = data.filter(bill => {
          const billDate = new Date(bill.date);
          const isAfterStartDate = startDate ? billDate >= new Date(startDate) : true;
          const isBeforeEndDate = endDate ? billDate <= new Date(endDate) : true;
          const isDescriptionMatch = descriptionFiler ? bill.description.toLowerCase().includes(descriptionFiler.toLowerCase()) : true;
          const isNoteMatch = noteFilter ? bill.note.toLowerCase().includes(noteFilter.toLowerCase()) : true; // New note filter condition
          return isAfterStartDate && isBeforeEndDate && isDescriptionMatch && isNoteMatch;
        });
        const sortedData = filteredData.sort((a, b) => new Date(a.date) - new Date(b.date));
        setBills(sortedData);
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
    if (!confirm('Are you sure you want to add or update this bill?')) {
        return; // Exit if the user cancels
    }
    const billData = {
      project_id: parseInt(project_id),
      upfront_cost: upFrontCost,
      date,
      description,
      labour: parseInt(labour),
      due: parseFloat(due),
      paid: parseFloat(paid),
      note
    };
    console.log('Bill data:', billData);
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
        console.log(billData);
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
    setDate(bill.date);
    setDescription(bill.description);
    setLabour(bill.labour);
    setDue(bill.due);
    setPaid(bill.paid);
    setNote(bill.note);
    setShowForm(true);
    setShowTable(false);
  };

  const resetForm = () => {
    setEditId(null);
    setDate('');
    setDescription('');
    setLabour(0);
    setDue(0);
    setPaid(0);
    setNote('');
    setShowForm(false);
    setShowTable(true);
    setError('');
  };

  return (
    <div style={{ padding: '10px', display: 'flex', flexDirection: 'column', gap: '10px' }}>
      <div className="start-and-end-dates" style={{ display: 'flex', gap: '10px' }}>
        <label>
          Start Date:
          <input type="date" value={startDate} onChange={(e) => setStartDate(e.target.value)} />
        </label>
        <label>
          End Date:
          <input type="date" value={endDate} onChange={(e) => setEndDate(e.target.value)} />
        </label>
      </div>
      <div style={{ display: 'flex', gap: '10px', alignItems: 'center' }}>
        <label>
          Description:
          <select style={{height: '2rem', gap: '10px', backgroundColor: '#080550', color: 'white' }} value={descriptionFiler} onChange={(e) => setDescriptionFilter(e.target.value)}>
            <option value="">All</option>
            {BILL_DESCRIPTIONS.map((item) => (
              <option className='filter-drop-down' key={item.value} value={item.value} style={{ fontWeight: 'bold' }}>{item.label}</option>
            ))}
          </select>
        </label>
        <label>
          Note Search:
          <input type="text" value={noteFilter} onChange={(e) => setNoteFilter(e.target.value)} placeholder="Search by note content" />
        </label>
        <button onClick={fetchBills}>Filter Bills</button>
      </div>
      <div style={{ display: 'flex', gap: '10px' }}>
        <button onClick={() => { setShowForm(false); setShowTable(true); fetchBills(); }}>View Bills</button>
        <button onClick={() => { resetForm(); setShowForm(true); setShowTable(false); }}>Add Bill</button>
      </div>

      {error && <div className="error">{error}</div>}
      {loading && <div>Loading...</div>}

      {showTable && !loading && (
        <table>
          <thead>
            <tr>
              <th style={{maxWidth: '10px'}}>Date</th>
              <th style={{minWidth: '55px'}}>Description</th>
              <th style={{minWidth: '10px'}}>QTY</th>
              <th style={{minWidth: '10px'}}>Bill</th>
              <th style={{minWidth: '8px'}}>Paid</th>
              <th style={{minWidth: '8px'}}>Due</th>
              <th style={{minWidth: '50px'}}>Note</th>
              <th className="actions-column" style={{minWidth: '200px'}}>Actions</th> {/* Add an actions column */}
            </tr>
          </thead>
          <tbody>
            {bills.length === 0 ? (
              <tr>
                <td colSpan="7">No bills available for this project.</td>
              </tr>
            ) : (
              <>
                {bills.map(bill => (
                  <tr key={bill.id}>
                    <td>{new Date(bill.date).toLocaleDateString('en-GB')}</td>
                    <td>{bill.description}</td>
                    <td>{bill.labour}</td>
                    <td>{(bill.due).toLocaleString('en-IN')}</td>
                    <td>{(bill.paid).toLocaleString('en-IN')}</td>
                    <td>{(bill.due - bill.paid).toLocaleString('en-IN')}</td>
                    <td>{bill.note}</td>
                    <td className="actions-column" style={{maxWidth: '15px'}}>
                      <button onClick={() => handleEditBill(bill)}>Edit </button>
                      <button onClick={() => handleDeleteBill(bill.id)}>Delete</button>
                    </td>
                  </tr>
                ))}
                <tr>
                  <td colSpan={3}> Total </td>
                  <td style={{ fontWeight: 'bold' }}>{(totalBill).toLocaleString('en-IN')}</td>
                  <td style={{fontWeight: 'bold'}}>{(totalPaid).toLocaleString('en-IN')}</td>
                  <td style={{fontWeight:'bold'}}>{(totalDue).toLocaleString('en-IN')}</td>
                </tr>
              </>
            )}
          </tbody>
        </table>
      )}

      {showForm && (
        <form onSubmit={handleAddOrUpdateBill} style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
          <label>
            Date:
            <input type="date" value={date} onChange={(e) => setDate(e.target.value)} required />
          </label>
          <label>
            Description:
              <select style={{height: '2rem', gap: '10px', backgroundColor: '#080550', color: 'white' }} value={description} onChange={(e) => setDescription(e.target.value)}>
              <option value="">All</option>
              {BILL_DESCRIPTIONS.map((item) => (
              <option className='filter-drop-down' key={item.value} value={item.value} style={{ fontWeight: 'bold' }}>{item.label}</option>
              ))}
              </select>
        </label>
          <label>
            Quantity (সংখ্যা):
            <input type="number" value={labour} onChange={(e) => setLabour(e.target.value)} />
          </label>
          <label>
            Bill Amount:
            <input type="number" value={due} onChange={(e) => setDue(e.target.value)} required />
          </label>
          <label>
            Paid:
            <input 
              type="number" 
              value={paid} 
              onChange={(e) => setPaid(e.target.value)} 
              required 
              disabled={userRole === 'site engineer'}
            />
          </label>
          <label>
            Note:
            <textarea value={note} onChange={(e) => setNote(e.target.value)} />
          </label>
          <div style={{ display: 'flex', gap: '10px' }}>
            <button type="submit">Save</button>
            <button type="button" onClick={resetForm}>Cancel</button>
          </div>
        </form>
      )}
    </div>
  );
}

export default DailyBillsCard;
