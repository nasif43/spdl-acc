import { useState } from 'preact/hooks';

const FilterControls = ({ onFilter }) => {
    const [startDate, setStartDate] = useState('');
    const [endDate, setEndDate] = useState('');
    const [descriptionFilter, setDescriptionFilter] = useState('');
    const [noteFilter, setNoteFilter] = useState('');
  
    const handleFilter = () => {
      onFilter({ startDate, endDate, descriptionFilter, noteFilter });
    };
  
    return (
      <div className="filter-controls">
        {/* Date, description, and note filters */}
        <button onClick={handleFilter}>Apply Filters</button>
      </div>
    );
  };

export default FilterControls;