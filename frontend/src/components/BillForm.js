import { useState } from 'preact/hooks';

const BillForm = ({ onSave, billData, onCancel }) => {
  const [formData, setFormData] = useState(billData || { date: '', description: '', due: 0, paid: 0, note: '' });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    onSave(formData);
  };

  return (
    <form onSubmit={handleSubmit}>
      {/* Input fields for date, description, due, paid, note */}
      <button type="submit">Save</button>
      <button onClick={onCancel}>Cancel</button>
    </form>
  );
};

export default BillForm;
