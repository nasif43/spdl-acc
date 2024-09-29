import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import '../styles/Table.css';
import CashMemo from '../components/CashMemo';
import inWords from '../utils/inWords';

const API_URI = 'http://103.191.241.13:4000';

const PaymentHistory = ({ project_id, unitId }) => {
    const [sortOrder, setSortOrder] = useState('asc'); // 'asc' for ascending, 'desc' for descending
    const [clientName, setClientName] = useState('');
    const [payments, setPayments] = useState([]);
    const [loading, setLoading] = useState(true);
    const [amount, setAmount] = useState('');
    const [date, setDate] = useState('');
    const [description, setDescription] = useState('');
    const [cash_bank, setCashBank] = useState('Cash');
    const [remarks, setRemarks] = useState('');
    const [error, setError] = useState('');
    const [showForm, setShowForm] = useState(false);
    const [showCashMemo, setShowCashMemo] = useState(false); // New state for showing CashMemo
    const [selectedPayment, setSelectedPayment] = useState(null); // New state for selected payment
    const [instalmentAmount, setInstalmentAmount] = useState(''); // Renamed to instalmentAmount
    const [settledAmount, setSettledAmount] = useState(''); // Renamed to settledAmount
    const [unitName, setUnitName] = useState('');
    const [projectName, setProjectName] = useState('');
    // State for date filter
    const [startDate, setStartDate] = useState('');
    const [endDate, setEndDate] = useState('');
    const [editingPaymentId, setEditingPaymentId] = useState(null); // New state to track the payment being edited

    useEffect(() => {
        fetch(`${API_URI}/projects/${project_id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                setProjectName(data.name);
            })
            .catch(error => {
                console.error('Error fetching project details:', error);
            });
    }, [project_id]);

    useEffect(() => {
        if (!unitId) {
            console.error('Unit ID is undefined');
            setLoading(false);
            return;
        }

        fetch(`${API_URI}/payment_history/${unitId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                setPayments(data);
                setLoading(false);
            })
            .catch(error => {
                console.error('Error fetching payment history:', error);
                setError('Failed to fetch payment history. Please try again.');
                setLoading(false);
            });

        // Fetch unit details to update settledAmount and instalmentAmount
        fetch(`${API_URI}/units/?project_id=${project_id}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(units => {
                console.log('Fetched units:', units); // Log the fetched units array
                console.log('unitId:', unitId); // Log the unitId being searched for
                const unit = units.find(u => u.id === Number(unitId)); // Convert unitId to a number
                console.log('Found unit:', unit); // Log the found unit (or undefined if not found)
                if (unit) {
                    setSettledAmount(unit.amount);
                    setInstalmentAmount(unit.paid);
                    setClientName(unit.client_name);
                    setUnitName(unit.unit_name);
                }
            })
            .catch(error => {
                console.error('Error fetching unit details:', error);
            });
    }, [unitId, project_id]);

    const handleSortByDate = () => {
        const sortedPayments = [...filteredPayments].sort((a, b) => {
            const dateA = new Date(a.date);
            const dateB = new Date(b.date);
            
            if (sortOrder === 'asc') {
                return dateA - dateB; // Ascending order
            } else {
                return dateB - dateA; // Descending order
            }
        });
    
        setPayments(sortedPayments); // Update payments with sorted array
        setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc'); // Toggle sort order
    };    

    const handleEditPayment = (paymentId) => {
        const paymentToEdit = payments.find(payment => payment.id === paymentId);
        if (paymentToEdit) {
            setAmount(paymentToEdit.amount !== null ? paymentToEdit.amount.toString() : '');
            setDate(paymentToEdit.date || '');
            setDescription(paymentToEdit.description || '');
            setCashBank(paymentToEdit.cash_bank || 'Cash');
            setRemarks(paymentToEdit.remarks || '');
            setEditingPaymentId(paymentId); // Set the payment ID being edited
            setShowForm(true);
        } else {
            setError('Payment not found');
        }
    };

    const handleAddOrEditPayment = (event) => {
        event.preventDefault();

        const newPayment = {
            project_id: project_id,
            unit_id: unitId,
            amount: parseFloat(amount),
            date: date,
            description: description,
            cash_bank: cash_bank,
            remarks: remarks,
        };

        if (editingPaymentId) {
            // Edit existing payment
            fetch(`${API_URI}/payment_history/payment_history/${editingPaymentId}`, {
                method: 'PUT', // Use PUT or PATCH for updating
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(newPayment),
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to edit payment');
                }
                return response.json();
            })
            .then(data => {
                setPayments(payments.map(payment => payment.id === editingPaymentId ? data : payment));
                setEditingPaymentId(null); // Reset editing payment ID
                setShowForm(false);
                setError('');
            })
            .catch(error => {
                console.error('Error editing payment:', error);
                setError('Failed to edit payment. Please try again.');
            });
        } else {
            // Add new payment
            fetch(`${API_URI}/payment_history/`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(newPayment),
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to add payment');
                }
                return response.json();
            })
            .then(data => {
                setPayments([...payments, data]);
                setAmount('');
                setDate('');
                setDescription('');
                setCashBank('Cash');
                setRemarks('');
                setError('');
                setShowForm(false);
            })
            .catch(error => {
                console.error('Error adding payment:', error);
                setError('Failed to add payment. Please try again.');
            });
        }
    };

    const handleDeletePayment = (paymentId) => {
        const confirmDelete = window.confirm('Are you sure you want to delete this payment?');
        if (confirmDelete) {
            fetch(`${API_URI}/payment_history/${paymentId}`, {
                method: 'DELETE',
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to delete payment');
                    }
                    setPayments(payments.filter(payment => payment.id !== paymentId)); // Remove the deleted payment from the state
                })
                .catch(error => {
                    console.error('Error deleting payment:', error);
                    setError('Failed to delete payment. Please try again.');
                });
        }
    };

    const handleGenerateCashMemo = (payment) => {
        console.log('Selected Payment:', payment);
        console.log('Amount in Words:', inWords(parseFloat(payment.amount)));
        setSelectedPayment(payment);
        setShowCashMemo(true);
    };

    // Filter payments by date range
    const filteredPayments = payments.filter(payment => {
        const paymentDate = new Date(payment.date);
        const start = startDate ? new Date(startDate) : null;
        const end = endDate ? new Date(endDate) : null;
        
        return (!start || paymentDate >= start) && (!end || paymentDate <= end);
    });
    
    // Calculate the total amount for filtered payments
    const filteredTotalAmount = filteredPayments.reduce((acc, payment) => acc + payment.amount, 0);
    
    if (loading) {
        return <div>Loading...</div>;
    }
    
    if (showCashMemo && selectedPayment) {
        return (
            <CashMemo
                date={selectedPayment.date}
                clientName={clientName}
                projectName={projectName}
                unit={unitName}
                paymentMethod={selectedPayment.cash_bank}
                amount={selectedPayment.amount}
                amountInWords={inWords(parseFloat(selectedPayment.amount))}
            />
        );
    }

    return (
        <div>
            <h1>Payment History for {clientName}</h1>
            
            {error && <div className="error">{error}</div>}

            {/* Date Filter Inputs */}
            <div>
                <label>
                    Start Date:
                    <input
                        type="date"
                        value={startDate}
                        onChange={(e) => setStartDate(e.target.value)}
                    />
                </label>
                <label>
                    End Date:
                    <input
                        type="date"
                        value={endDate}
                        onChange={(e) => setEndDate(e.target.value)}
                    />
                </label>
            </div>

            <table>
                <thead>
                    <tr>
                        <th onClick={handleSortByDate}>Date {sortOrder === 'asc' ? '▲' : '▼'}</th>
                        <th>Description (বিবরণ)</th>
                        <th>Cash/Bank</th>
                        <th>Paid Amount</th>
                        <th className='actions-column'>Actions</th> {/* Added column for delete button */}
                    </tr>
                </thead>
                <tbody>
                    {filteredPayments.length === 0 ? (
                        <tr>
                            <td colSpan="5">No payment history available for the selected date range.</td>
                        </tr>
                    ) : (
                        filteredPayments.map(payment => (
                            <tr key={payment.id}>
                                <td>{new Date(payment.date).toLocaleDateString('en-GB')}</td>
                                <td>{payment.description}</td>
                                <td>{payment.cash_bank}</td>
                                <td>{payment.amount}</td>
                                <td className='actions-column'>
                                    <button onClick={() => handleDeletePayment(payment.id)}>Delete</button>
                                    <button onClick={() => handleEditPayment(payment.id)}>Edit</button>
                                    <button onClick={() => handleGenerateCashMemo(payment)}>Generate Cash Memo</button>
                                </td>
                            </tr>
                        ))
                    )}
                    <tr>
                        <td colSpan={5}></td>
                    </tr>
                    <tr>
                        <td colSpan={1}></td>
                        <td><strong>Total Settled Amount:</strong> {settledAmount}</td>
                        <td><strong>Instalment Amount:</strong> {instalmentAmount}</td>
                        <td><strong>Total Paid Amount:</strong> {filteredTotalAmount}</td>
                    </tr>
                    <tr>
                        <td colSpan={3}></td>
                        <td><strong>Total Due Amount:</strong> {settledAmount - filteredTotalAmount}</td>
                    </tr>
                </tbody>
            </table>

            <button onClick={() => setShowForm(!showForm)}>
                {showForm ? 'Cancel' : 'Add Payment'}
            </button>

            {showForm && (
                <form onSubmit={handleAddOrEditPayment}>
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
                        Description (বিবরণ):
                        <input
                            type="text"
                            value={description}
                            onChange={(e) => setDescription(e.target.value)}
                        />
                    </label>
                    <label>
                        Cash/Bank:
                        <select
                            value={cash_bank}
                            onChange={(e) => setCashBank(e.target.value)}
                            required
                        >
                            <option value="Cash">Cash</option>
                            <option value="Bank">Bank</option>
                        </select>
                    </label>
                    <label>
                        Amount:
                        <input
                            type="number"
                            value={amount}
                            onChange={(e) => setAmount(e.target.value)}
                            required
                        />
                    </label>
                    <button type="submit">Submit Payment</button>
                </form>
            )}
        </div>
    );
}; 

export default PaymentHistory;