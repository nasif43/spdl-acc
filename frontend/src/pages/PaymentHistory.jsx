import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
import '../styles/Table.css';

const API_URI = process.env.REACT_APP_API_URL || 'http://localhost:4000';

const PaymentHistory = ({ project_id, unitId }) => {
    const [payments, setPayments] = useState([]);
    const [loading, setLoading] = useState(true);
    const [amount, setAmount] = useState('');
    const [date, setDate] = useState('');
    const [description, setDescription] = useState('');
    const [cash_bank, setCashBank] = useState('Cash');
    const [remarks, setRemarks] = useState('');
    const [error, setError] = useState('');
    const [showForm, setShowForm] = useState(false);

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
    }, [unitId]);

    const handleAddPayment = (event) => {
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
    };

    const handleDeletePayment = (paymentId) => {
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
    };

    if (loading) {
        return <div>Loading...</div>;
    }

    return (
        <div>
            <h1>Payment History for Project {project_id}</h1>
            
            {error && <div className="error">{error}</div>}

            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Description (বিবরণ)</th>
                        <th>Cash/Bank</th>
                        <th>Amount</th>
                        <th>Actions</th> {/* Added column for delete button */}
                    </tr>
                </thead>
                <tbody>
                    {payments.length === 0 ? (
                        <tr>
                            <td colSpan="7">No payment history available for this unit.</td>
                        </tr>
                    ) : (
                        payments.map(payment => (
                            <tr key={payment.id}>
                                <td>{payment.date}</td>
                                <td>{payment.description}</td>
                                <td>{payment.cash_bank}</td>
                                <td>{payment.amount}</td>
                                <td>{payment.remarks}</td>
                                <td>
                                    <button onClick={() => handleDeletePayment(payment.id)}>Delete</button>
                                </td>
                            </tr>
                        ))
                    )}
                </tbody>
            </table>

            <button onClick={() => setShowForm(!showForm)}>
                {showForm ? 'Cancel' : 'Add Payment'}
            </button>

            {showForm && (
                <form onSubmit={handleAddPayment}>
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
