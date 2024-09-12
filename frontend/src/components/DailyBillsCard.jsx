import { h } from 'preact';
import { useState } from 'preact/hooks';
import '../styles/Table.css'; // Assuming you have some basic styles for the table

const API_URI = process.env.REACT_APP_API_URL || 'http://103.191.241.13:4000';

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

  const [editId, setEditId] = useState(null); // For editing
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

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
        // Apply client-side filtering based on date range
        const filteredData = data.filter(bill => {
          const billDate = new Date(bill.date);
          const isAfterStartDate = startDate ? billDate >= new Date(startDate) : true;
          const isBeforeEndDate = endDate ? billDate <= new Date(endDate) : true;
          return isAfterStartDate && isBeforeEndDate;
        });
        
        setBills(filteredData); // Set the filtered bills
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
    <div style={{ padding: '10px' }}>
      <label>
        Start Date:
        <input type="date" value={startDate} onChange={(e) => setStartDate(e.target.value)} />
      </label>
      <label>
        End Date:
        <input type="date" value={endDate} onChange={(e) => setEndDate(e.target.value)} />
      </label>
      <button onClick={fetchBills}>Filter Bills</button>
      <div>
        <button style={{ marginRight: '5px' }} onClick={() => { setShowForm(false); setShowTable(true); fetchBills(); }}>View Bills</button>
        <button style={{ marginLeft: '5px' }} onClick={() => { resetForm(); setShowForm(true); setShowTable(false); }}>Add Bill</button>

        {error && <div className="error">{error}</div>}
        {loading && <div>Loading...</div>}

        {showTable && !loading && (
          <table>
            <thead>
              <tr>
                <th>Date</th>
                <th>Description (বিবরণ)</th>
                <th>No. of Labours(শ্রমিক সংখ্যা)</th>
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
                    <td>{bill.date}</td>
                    <td>{bill.description}</td>
                    <td>{bill.labour}</td>
                    <td>{bill.due}</td>
                    <td>{bill.paid}</td>
                    <td>{bill.note}</td>
                    <td>
                      <button onClick={() => handleEditBill(bill)}>Edit </button>
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
            <select value={description} onChange={(e) => setDescription(e.target.value)} required>
              <option value="" disabled>আইটেম বাছাই করুন</option>
              <option value="Signing Money">সাইনিং মানি (Signing Money)</option>
              <option value="Deed">দলিল (Deed)</option>
              <option value="Architect">আর্কিটেক্ট (Architect)</option>
              <option value="Plan Pass/Approval">প্ল্যান পাশ/অনুমোদন (Plan Pass/Approval)</option>
              <option value="Miscellaneous">বিবিধ (Miscellaneous)</option>
              <option value="Sign Board">সাইন বোর্ড (Sign Board)</option>
              <option value="Utility">ইউটিলিটি (Utility)</option>
              <option value="Guard Salary">গার্ডের বেতন (Guard Salary)</option>
              <option value="Sanitary Expense">পানিসম্পদ খরচ (Sanitary Expense)</option>
              <option value="Piling Expense">পাইলিং খরচ (Piling Expense)</option>
              <option value="Steel Rod Purchase">রড কেনা (Steel Rod Purchase)</option>
              <option value="Cement">সিমেন্ট (Cement)</option>
              <option value="Sand">বালি (Sand)</option>
              <option value="Stone">পাথর (Stone)</option>
              <option value="Electrician">ইলেকট্রিশিয়ান (Electrician)</option>
              <option value="Electric Items Purchase">বৈদ্যুতিক সরঞ্জাম কেনা (Electric Items Purchase)</option>
              <option value="Mati Kata">মাটি কাটা (Mati Kata)</option>
              <option value="Raj Mistri Head">রাজ মিস্ত্রি হেড (Raj Mistri Head)</option>
              <option value="Raj Mistri Helper">রাজ মিস্ত্রি সহকারী (Raj Mistri Helper)</option>
              <option value="Rod Mistri Head">রড মিস্ত্রি হেড(Rod Mistri Head)</option>
              <option value="Rod Mistri Helper">রড মিস্ত্রি সহকারী (Rod Mistri Helper)</option>
              <option value="Am Kat">আম গাছ কাটা (Am Kat)</option>
              <option value="Concrete-Casting">ঢালাই (Concrete Casting)</option>
              <option value="Purchased Bamboo">বাঁশ কেনা (Purchased Bamboo)</option>
              <option value="Hardware Materials">হার্ডওয়্যার মালামাল (Hardware Materials)</option>
              <option value="Bricks Purchase">ইট ক্রয় (Bricks Purchase)</option>
              <option value="Tiles Purchase">টাইলস ক্রয় (Tiles Purchase)</option>
              <option value="Tiles Assembler Head">টাইলস মিস্ত্রি হেড(Tiles Assembler Head)</option>
              <option value="Tiles Assembler Helper">টাইলস মিস্ত্রি সহকারী (Tiles Assembler Helper)</option>
              <option value="Chipping Head">চিপিং মিস্ত্রি হেড (Chipping Head)</option>
              <option value="Chipping Helper">চিপিং মিস্ত্রি সহকারী (Chipping Helper)</option>
              <option value="Paint Purchase">রং ক্রয় (Paint Purchase)</option>
              <option value="Day Labour Bill">দিনমজুর বিল (Day Labour Bill)</option>
              <option value="Door Frame Purchase">চৌকাঠ ক্রয় (Door Frame Purchase)</option>
              <option value="Door Purchase">দরজা ক্রয় (Door Purchase)</option>
              <option value="Thai Glass Purchase">থাই গ্লাস ক্রয় (Thai Glass Purchase)</option>
              <option value="Guard Salary">গার্ড বেতন (Guard Salary)</option>
              <option value="Engineer Salary">ইঞ্জিনিয়ার বেতন (Engineer Salary)</option>
              <option value="Maid Salary">বুয়া বেতন (Maid Salary)</option>
              <option value="Head Painter">রং মিস্ত্রি হেড (Head Painter)</option>
              <option value="Painter's Helper">রং মিস্ত্রি সহকারী (Painter's Helper)</option>
              <option value="Head Welder">গ্রিল মিস্ত্রি হেড (Head Welder)</option>
              <option value="Welder's Helper">গ্রিল মিস্ত্রি সহকারী (Welder's Helper)</option>
              <option value="Lift + Generator / Substation">লিফট + জেনারেটর / সাবস্টেশন (Lift + Generator / Substation)</option>
            </select>
          </label>

            <label>
              Labour (শ্রমিক সংখ্যা):
              <input type="number" value={labour} onChange={(e) => setLabour(e.target.value)} />
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
            <button type="submit">Save</button>
            <button type="button" onClick={resetForm}>Cancel</button>
          </form>
        )}
      </div>
    </div>
  );
}

export default DailyBillsCard;
