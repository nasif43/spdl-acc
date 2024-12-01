const API_BASE_URL = 'http://103.191.241.13:4000'; // Replace with your actual API base URL

// Fetch bills data with optional filters
export const fetchBillsData = async (projectId, filters = {}) => {
  try {
    const query = new URLSearchParams({
      startDate: filters.startDate || '',
      endDate: filters.endDate || '',
      description: filters.descriptionFilter || '',
      note: filters.noteFilter || '',
    });

    const response = await fetch(`${API_BASE_URL}/projects/${projectId}/bills?${query}`);
    if (!response.ok) {
      throw new Error('Failed to fetch bills data');
    }

    return await response.json();
  } catch (error) {
    console.error('Error fetching bills data:', error);
    throw error;
  }
};

// Add a new bill or update an existing one based on the presence of billId
export const addOrUpdateBill = async (projectId, billData, billId = null) => {
  try {
    const response = await fetch(
      `${API_BASE_URL}/projects/${projectId}/bills${billId ? `/${billId}` : ''}`,
      {
        method: billId ? 'PUT' : 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(billData),
      }
    );

    if (!response.ok) {
      throw new Error(`Failed to ${billId ? 'update' : 'add'} bill`);
    }

    return await response.json();
  } catch (error) {
    console.error(`Error ${billId ? 'updating' : 'adding'} bill:`, error);
    throw error;
  }
};

// Delete a bill by its ID
export const deleteBillById = async (billId) => {
  try {
    const response = await fetch(`${API_BASE_URL}/bills/${billId}`, {
      method: 'DELETE',
    });

    if (!response.ok) {
      throw new Error('Failed to delete bill');
    }
  } catch (error) {
    console.error('Error deleting bill:', error);
    throw error;
  }
};
