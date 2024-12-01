import { useState } from 'preact/hooks';


const BillsTable = ({ bills, onEdit, onDelete, totals }) => (
    <table>
      <thead>
        <tr>{/* Headers */}</tr>
      </thead>
      <tbody>
        {bills.length > 0 ? (
          bills.map((bill) => (
            <tr key={bill.id}>
              {/* Bill data and actions */}
              <button onClick={() => onEdit(bill)}>Edit</button>
              <button onClick={() => onDelete(bill.id)}>Delete</button>
            </tr>
          ))
        ) : (
          <tr><td colSpan="7">No bills available</td></tr>
        )}
        <tr>{/* Totals row using totals props */}</tr>
      </tbody>
    </table>
  );

export default BillsTable;