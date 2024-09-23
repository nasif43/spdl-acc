import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import { Link } from 'preact-router'; // Import Link for navigation
import '../styles/Table.css';

const API_URI = 'http://103.191.241.13:4000';

const AddUnitForm = ({ projectId, onUnitAdded }) => {
    // Form state management code remains the same
    const [unitName, setUnitName] = useState('');
    const [date, setDate] = useState('');
    const [clientName, setClientName] = useState('');
    const [clientNumber, setClientNumber] = useState('');
    const [clientNid, setClientNid] = useState('');
    const [amount, setAmount] = useState(0);
    const [paid, setPaid] = useState(0);
    const [sold, setSold] = useState(false);

    const handleSubmit = (event) => {
        event.preventDefault();

        const unitData = {
            project_id: projectId,
            unit_name: unitName,
            date: date,
            client_name: clientName,
            client_number: clientNumber,
            client_nid: clientNid,
            amount: amount,
            paid: paid,
            sold: sold,
        };

        fetch(`${API_URI}/units/`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(unitData),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Unit added:', data);
                onUnitAdded(); // Call the callback to refresh data or close the form
            })
            .catch(error => console.error('Error adding unit:', error));
    };

    return (
        <form onSubmit={handleSubmit}>
            <h2>Add New Unit</h2>
            {/* Form inputs remain the same */}
            <label>
                Unit Name:
                <input
                    type="text"
                    value={unitName}
                    onChange={(e) => setUnitName(e.target.value)}
                    required
                />
            </label>
            <label>
                Date:
                <input
                    type="date"
                    value={date}
                    onChange={(e) => setDate(e.target.value)}
                    required
                />
            </label>
            <label>
                Client Name:
                <input
                    type="text"
                    value={clientName}
                    onChange={(e) => setClientName(e.target.value)}
                    required
                />
            </label>
            <label>
                Client Number:
                <input
                    type="text"
                    value={clientNumber}
                    onChange={(e) => setClientNumber(e.target.value)}
                    required
                />
            </label>
            <label>
                Client NID:
                <input
                    type="text"
                    value={clientNid}
                    onChange={(e) => setClientNid(e.target.value)}
                    required
                />
            </label>
            <label>
                Settled Amount:
                <input
                    type="number"
                    value={amount}
                    onChange={(e) => setAmount(Number(e.target.value))}
                    required
                />
            </label>
            <label>
                Instalment Amount:
                <input
                    type="number"
                    value={paid}
                    onChange={(e) => setPaid(Number(e.target.value))}
                    required
                />
            </label>
            <label>
                Sold:
                <input
                    type="checkbox"
                    checked={sold}
                    onChange={(e) => setSold(e.target.checked)}
                />
            </label>
            <button type="submit">Add Unit</button>
        </form>
    );
};

const ProjectDetail = ({ id }) => {
    const [units, setUnits] = useState([]);
    const [loading, setLoading] = useState(true);
    const [showAddUnitForm, setShowAddUnitForm] = useState(false);
    const [projectName, setProjectName] = useState('');
    const [dueAmounts, setDueAmounts] = useState({});

    useEffect(() => {
        if (!id) {
            console.error('Project ID is undefined');
            return;
        }

        // Fetch project name
        fetch(`${API_URI}/projects/${id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Project data:', data);
                setProjectName(data.name || `Project ${id}`);
            })
            .catch(error => {
                console.error('Error fetching project name:', error);
            });

        // Fetch units
        fetch(`${API_URI}/units/?project_id=${id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Units data:', data);
                setUnits(data);
                setLoading(false);
                data.forEach(unit => fetchDueAmount(unit.id, unit.amount));
            })
            .catch(error => {
                console.error('Error fetching units:', error);
                setLoading(false);
            });
    }, [id]);

    const fetchDueAmount = (unitId, settledAmount) => {
        console.log(`Fetching due amount for unit ${unitId} with settled amount ${settledAmount}`);
        fetch(`${API_URI}/payment_history/${unitId}`)
            .then(response => response.json())
            .then(payments => {
                console.log(`Payments for unit ${unitId}:`, payments);
                if (Array.isArray(payments)) {
                    const totalPaid = payments.reduce((sum, payment) => sum + payment.amount, 0);
                    console.log(`Total paid for unit ${unitId}: ${totalPaid}`);
                    setDueAmounts(prev => ({ ...prev, [unitId]: settledAmount - totalPaid }));
                } else {
                    console.error('Payments response is not an array:', payments);
                    setDueAmounts(prev => ({ ...prev, [unitId]: 'Error' }));
                }
            })
            .catch(error => {
                console.error('Error fetching payments:', error);
                setDueAmounts(prev => ({ ...prev, [unitId]: 'Error' }));
            });
    };

    const handleAddUnitClick = () => {
        setShowAddUnitForm(true);
    };

    const handleUnitAdded = () => {
        setShowAddUnitForm(false);
        fetch(`${API_URI}/units/?project_id=${id}`)
            .then(response => response.json())
            .then(data => {
                console.log('Updated units data:', data);
                setUnits(data);
                data.forEach(unit => fetchDueAmount(unit.id, unit.amount));
            })
            .catch(error => console.error('Error fetching units:', error));
    };

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <div>
            <h1>Units for Project {projectName}</h1>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Unit Name</th>
                        <th>Client Name</th>
                        <th>Phone Number</th>
                        <th>NID</th>
                        <th>Settled Amount</th>
                        <th>Instalment Amount</th>
                        <th>Due Amount</th> {/* New column */}
                        <th className="actions-column">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {units.length === 0 ? (
                        <tr>
                            <td colSpan="9">No units available for this project.</td>
                        </tr>
                    ) : (
                        units.map(unit => (
                            <tr key={unit.id}>
                                <td>{new Date(unit.date).toLocaleDateString('en-GB')}</td>
                                <td>{unit.unit_name}</td>
                                <td>{unit.client_name}</td>
                                <td>{unit.client_number}</td>
                                <td>{unit.client_nid}</td>
                                <td>{unit.amount}</td>
                                <td style={{minWidth:'10px'}}>{unit.paid}</td>
                                <td>{dueAmounts[unit.id] !== undefined ? dueAmounts[unit.id] : 'Calculating...'}</td> {/* Due amount */}
                                <td className='actions-column'>
                                    <button>
                                        <Link href={`/payment_history/${id}/${unit.id}`} style={{ color: 'white' }}>
                                            View Payments
                                        </Link>
                                    </button>
                                    {/* <button onClick={() => handleDeleteUnit(unit.id)}>
                                        Delete
                                    </button> */}
                                </td>
                            </tr>
                        ))
                    )}
                    <tr>
                        <td colSpan="9">
                            <button onClick={handleAddUnitClick}>Add More</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            {showAddUnitForm && (
                <AddUnitForm
                    projectId={id}
                    onUnitAdded={handleUnitAdded}
                />
            )}
        </div>
    );
};

export default ProjectDetail;
