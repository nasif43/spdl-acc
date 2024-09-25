import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import { Link } from 'preact-router'; // Import Link for navigation
import '../styles/Table.css';

const API_URI = 'http://103.191.241.13:4000';

const AddOrEditUnitForm = ({ projectId, unitToEdit, onUnitAddedOrEdited }) => {
    const [unitName, setUnitName] = useState(unitToEdit ? unitToEdit.unit_name : '');
    const [date, setDate] = useState(unitToEdit ? unitToEdit.date : '');
    const [clientName, setClientName] = useState(unitToEdit ? unitToEdit.client_name : '');
    const [clientNumber, setClientNumber] = useState(unitToEdit ? unitToEdit.client_number : '');
    const [clientNid, setClientNid] = useState(unitToEdit ? unitToEdit.client_nid : '');
    const [amount, setAmount] = useState(unitToEdit ? unitToEdit.amount : 0);
    const [paid, setPaid] = useState(unitToEdit ? unitToEdit.paid : 0);
    const [sold, setSold] = useState(unitToEdit ? unitToEdit.sold : false);

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

        const url = unitToEdit
            ? `${API_URI}/units/${unitToEdit.id}`
            : `${API_URI}/units/`;

        const method = unitToEdit ? 'PUT' : 'POST';

        fetch(url, {
            method: method,
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
                console.log(unitToEdit ? 'Unit updated:' : 'Unit added:', data);
                onUnitAddedOrEdited();
            })
            .catch(error => console.error(unitToEdit ? 'Error updating unit:' : 'Error adding unit:', error));
    };

    return (
        <form onSubmit={handleSubmit}>
            <h2>{unitToEdit ? 'Edit Unit' : 'Add New Unit'}</h2>
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
            <button type="submit">{unitToEdit ? 'Update Unit' : 'Add Unit'}</button>
        </form>
    );
};

const ProjectDetail = ({ id }) => {
    const [units, setUnits] = useState([]);
    const [loading, setLoading] = useState(true);
    const [showAddUnitForm, setShowAddUnitForm] = useState(false);
    const [projectName, setProjectName] = useState('');
    const [dueAmounts, setDueAmounts] = useState({});
    const [unitToEdit, setUnitToEdit] = useState(null);

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

    const handleEditUnit = (unit) => {
        setUnitToEdit(unit);
        setShowAddUnitForm(true);
    };

    const handleUnitAddedOrEdited = () => {
        setShowAddUnitForm(false);
        setUnitToEdit(null);
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
            <h1>Units for {projectName}</h1>
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
                                    <button onClick={() => handleEditUnit(unit)}>
                                        Edit
                                    </button>
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
                <AddOrEditUnitForm
                    projectId={id}
                    unitToEdit={unitToEdit}
                    onUnitAddedOrEdited={handleUnitAddedOrEdited}
                />
            )}
        </div>
    );
};

export default ProjectDetail;
