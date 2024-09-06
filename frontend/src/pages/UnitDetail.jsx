import { h } from 'preact';
import { useEffect, useState } from 'preact/hooks';
const API_URI = process.env.REACT_APP_API_URL || 'http://localhost:4000';
const UnitDetail = ({ unitId }) => {
    const [payments, setPayments] = useState([]);

    useEffect(() => {
        // Fetch payment history for the selected unit
        fetch(`${API_URI}/payment_history/${unitId}`)
            .then(response => response.json())
            .then(data => setPayments(data))
            .catch(error => console.error('Error fetching payment history:', error));
    }, [unitId]);

    return (
        <div>
            <h1>Payment History for Unit {unitId}</h1>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    {payments.map(payment => (
                        <tr key={payment.id}>
                            <td>{payment.date}</td>
                            <td>{payment.amount}</td>
                            <td>{payment.method}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
};

export default UnitDetail;
