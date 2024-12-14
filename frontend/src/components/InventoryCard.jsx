import { h } from 'preact';
import { useState, useEffect } from 'preact/hooks';
import { INVENTORY_ITEMS } from '../constants';
import '../styles/Table.css'; // Assuming you have some basic styles for the table

const API_URI = 'http://103.191.241.13:4000';

function InventoryCard({ project_id }) {
    const [inventoryItems, setInventoryItems] = useState([]);
    const [showForm, setShowForm] = useState(false);
    const [showTable, setShowTable] = useState(false);
    const [itemName, setItemName] = useState('');
    const [quantity, setQuantity] = useState(0);
    const [quantityUsed, setQuantityUsed] = useState(0);
    const [notes, setNotes] = useState('');
    const [editId, setEditId] = useState(null);
    const [error, setError] = useState('');
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        fetchInventory();
    }, []);

    const fetchInventory = () => {
        setLoading(true);
        const token = localStorage.getItem('token');

        fetch(`${API_URI}/inventory?project_id=${project_id}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to fetch inventory');
                }
                return response.json();
            })
            .then(data => {
                setInventoryItems(data);
                setLoading(false);
                setShowTable(true);
                setShowForm(false);
            })
            .catch(err => {
                console.error('Failed to fetch inventory:', err);
                setError('Failed to fetch inventory.');
                setLoading(false);
            });
    };

    const handleAddOrUpdateInventory = (e) => {
        e.preventDefault();
        const inventoryData = {
            project_id: parseInt(project_id),
            item_name: itemName,
            quantity: parseInt(quantity),
            quantity_used: parseInt(quantityUsed),
            notes: notes,
        };
        const token = localStorage.getItem('token');
        if (!token) {
            setError('No token found. Please log in again.');
            return;
        }

        const url = editId ? `${API_URI}/inventory/${editId}` : `${API_URI}/inventory/`;
        const method = editId ? 'PUT' : 'POST';

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`,
            },
            body: JSON.stringify(inventoryData),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to add or update inventory');
                }
                return response.json();
            })
            .then(data => {
                if (editId) {
                    setInventoryItems(inventoryItems.map(item => (item.id === editId ? data : item)));
                } else {
                    setInventoryItems([...inventoryItems, data]);
                }
                resetForm();
            })
            .catch(err => {
                console.error('Error adding or updating inventory:', err);
                setError('Failed to add or update inventory. Please try again.');
            });
    };

    const handleDeleteInventory = (id) => {
        const token = localStorage.getItem('token');
        if (!token) {
            setError('No token found. Please log in again.');
            return;
        }

        if (confirm('Are you sure you want to delete this inventory item?')) {
            fetch(`${API_URI}/inventory/${id}`, {
                method: 'DELETE',
                headers: {
                    'Authorization': `Bearer ${token}`,
                },
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to delete inventory item');
                    }
                    setInventoryItems(inventoryItems.filter(item => item.id !== id));
                })
                .catch(err => {
                    console.error('Error deleting inventory item:', err);
                    setError('Failed to delete inventory item. Please try again.');
                });
        }
    };

    const handleEditInventory = (item) => {
        setEditId(item.id);
        setItemName(item.item_name);
        setQuantity(item.quantity);
        setQuantityUsed(item.quantity_used);
        setNotes(item.notes);
        setShowForm(true);
        setShowTable(false);
    };

    const resetForm = () => {
        setEditId(null);
        setItemName('');
        setQuantity(0);
        setQuantityUsed(0);
        setNotes('');
        setShowForm(false);
        setShowTable(true);
        setError('');
    };

    const totalQuantity = inventoryItems.reduce((acc, item) => acc + item.quantity, 0);
    const totalQuantityUsed = inventoryItems.reduce((acc, item) => acc + item.quantity_used, 0);
    const totalQuantityRemaining = totalQuantity - totalQuantityUsed;

    return (
        <div style={{ padding: '10px', display: 'flex', flexDirection: 'column', gap: '10px' }}>
            <div style={{ display: 'flex', gap: '10px' }}>
                <button onClick={() => { setShowForm(false); setShowTable(true); fetchInventory(); }}>View Inventory</button>
                <button onClick={() => { resetForm(); setShowForm(true); setShowTable(false); }}>Add Inventory</button>
            </div>

            {error && <div className="error">{error}</div>}
            {loading && <div>Loading...</div>}

            {showTable && !loading && (
                <table>
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Quantity Used</th>
                            <th>Quantity Remaining</th>
                            <th>Notes</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {inventoryItems.length === 0 ? (
                            <tr>
                                <td colSpan="5">No inventory items available for this project.</td>
                            </tr>
                        ) : (
                            inventoryItems.map(item => (
                                <tr key={item.id}>
                                    <td>{item.item_name}</td>
                                    <td>{item.quantity}</td>
                                    <td>{item.quantity_used}</td>
                                    <td>{item.quantity - item.quantity_used}</td>
                                    <td>{item.notes}</td>
                                    <td>
                                        <button onClick={() => handleEditInventory(item)}>Edit</button>
                                        <button onClick={() => handleDeleteInventory(item.id)}>Delete</button>
                                    </td>
                                </tr>
                            ))
                        )}
                        {inventoryItems.length > 0 && (
                            <tr>
                                <td><strong>Total</strong></td>
                                <td><strong>{totalQuantity}</strong></td>
                                <td><strong>{totalQuantityUsed}</strong></td>
                                <td><strong>{totalQuantityRemaining}</strong></td>
                                <td></td>
                            </tr>
                        )}
                    </tbody>
                </table>
            )}

            {showForm && (
                <form onSubmit={handleAddOrUpdateInventory} style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                    <label>
                        Item Name:
                        <select style={{height: '2rem', gap: '10px', backgroundColor: '#080550', color: 'white' }} value={itemName} onChange={(e) => setItemName(e.target.value)}>
                                      <option value="">All</option>
                                      {INVENTORY_ITEMS.map((item) => (
                                      <option className='filter-drop-down' key={item.value} value={item.value} style={{ fontWeight: 'bold' }}>{item.label}</option>
                                      ))}
                                      </select>
                    </label>
                    <label>
                        Quantity:
                        <input type="number" value={quantity} onChange={(e) => setQuantity(e.target.value)} required />
                    </label>
                    <label>
                        Quantity Used:
                        <input type="number" value={quantityUsed} onChange={(e) => setQuantityUsed(e.target.value)} />
                    </label>
                    <label>
                        Notes:
                        <textarea value={notes} onChange={(e) => setNotes(e.target.value)} />
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

export default InventoryCard;