import { h } from 'preact';

const CashMemo = ({ date, clientName, projectName, unit, paymentMethod, amount, amountInWords }) => {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial, sans-serif' }}>
      <div style={{ textAlign: 'center', marginBottom: '20px' }}>
        <h2>Money Receipt</h2>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '20px' }}>
        <div>
          <p>Sarker Properties & Developments Ltd.</p>
          <p>41, UTTARA GARIB E NAWAZ AVENUE, Dhaka, Bangladesh</p>
          <p>01911997721</p>
          <p>info@sarkerpropertiesltd.com</p>
        </div>
        <div>
          <p>Date: <strong>{date}</strong></p>
        </div>
      </div>
      <div style={{ marginBottom: '20px' }}>
        <h3>Client Information</h3>
        <table style={{ width: '100%', borderCollapse: 'collapse' }}>
          <tbody>
            <tr>
              <td>Name</td>
              <td> {clientName}</td>
            </tr>
            <tr>
              <td>Project Name</td>
              <td> {projectName}</td>
            </tr>
            <tr>
              <td>Unit Description</td>
              <td> {unit}</td>
            </tr>
            <tr>
              <td>By Cash / Cheque No</td>
              <td> {paymentMethod}</td>
            </tr>
            <tr>
              <td>P.O/TID NO</td>
              <td> </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div style={{ marginBottom: '20px' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', border: '1px solid black' }}>
          <thead>
            <tr>
              <th style={{ border: '1px solid black', padding: '8px' }}>DESCRIPTION</th>
              <th style={{ border: '1px solid black', padding: '8px' }}>AMOUNT</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style={{ border: '1px solid black', padding: '8px' }}><strong>TOTAL</strong></td>
              <td style={{ border: '1px solid black', padding: '8px' }}><strong>{amount}</strong></td>
            </tr>
            <tr>
              <td style={{ border: '1px solid black', padding: '8px' }}><strong>In Word</strong></td>
              <td style={{ border: '1px solid black', padding: '8px' }}>{amountInWords} Taka Only</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: '40px' }}>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p>Client Signature</p>
        </div>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p>Accounts Signature</p>
        </div>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p>SPDL Management</p>
        </div>
      </div>
      <div style={{ textAlign: 'center', marginTop: '40px' }}>
        <p>Received with thanks from Sarker Properties & Developments Ltd</p>
        <h3>THANK YOU</h3>
      </div>
      <footer style={{ textAlign: 'center', marginTop: '20px', fontSize: '12px', borderTop: '1px solid #ccc', paddingTop: '10px' }}>
        <p>Office: House 41, Road Gareb-E-Newaz Avenue, Sector 11, Uttara, Dhaka-1230.</p>
      </footer>
    </div>
  );
};

export default CashMemo;
