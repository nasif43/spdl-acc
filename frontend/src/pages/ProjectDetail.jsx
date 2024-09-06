import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import { Link } from 'preact-router'; // Import Link for navigation
import '../styles/Table.css';

const API_URI = process.env.REACT_APP_API_URL || 'http://localhost:4000';
const AddUnitForm = ({ projectId, onUnitAdded }) => {
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
                Amount:
                <input
                    type="number"
                    value={amount}
                    onChange={(e) => setAmount(Number(e.target.value))}
                    required
                />
            </label>
            <label>
                Paid:
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

    useEffect(() => {
        if (!id) {
            console.error('Project ID is undefined');
            return;
        }

        fetch(`${API_URI}/units/?project_id=${id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                setUnits(data);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching units:', error);
                setLoading(false);
            });
    }, [id]);

    const handleAddUnitClick = () => {
        setShowAddUnitForm(true);
    };

    const handleUnitAdded = () => {
        setShowAddUnitForm(false);
        fetch(`${API_URI}/units/?project_id=${id}`)
            .then(response => response.json())
            .then(data => setUnits(data))
            .catch(error => console.error('Error fetching units:', error));
    };

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <div>
            <h1>Units for Project {id}</h1>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Unit Name</th>
                        <th>Client Name</th>
                        <th>Phone Number</th>
                        <th>NID</th>
                        <th>Settled Amount</th>
                        <th>Instalment</th>
                        <th>Purchase Status</th>
                        <th>Actions</th>
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
                                <td>{unit.date}</td>
                                <td>{unit.unit_name}</td>
                                <td>{unit.client_name}</td>
                                <td>{unit.client_number}</td>
                                <td>{unit.client_nid}</td>
                                <td>{unit.amount}</td>
                                <td>{unit.paid}</td>
                                <td>{unit.sold ? 'Sold' : 'Available'}</td>
                                <td>
                                    <button>
                                        <Link href={`/payment_history/${id}/${unit.id}`} style={{ color: 'white'}}>
                                            View Payments
                                        </Link>
                                    </button>
                                </td>
                            </tr>
                        ))
                    )}
                    <tr>
                        <td colSpan="9">
                            <button className="add-more-button" onClick={handleAddUnitClick}>Add More</button>
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