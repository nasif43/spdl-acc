import { h } from 'preact';

const CashMemo = ({ date, clientName, projectName, unit, paymentMethod, amount, amountInWords }) => {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial, sans-serif' }}>
      <div style={{ textAlign: 'center', marginBottom: '20px' }}>
        <h2>Money Receipt</h2>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '20px' }}>
        <div>
          <p><strong>Sarker Properties & Developments Ltd.</strong></p>
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
              <td><strong>Name</strong></td>
              <td> {clientName}</td>
            </tr>
            <tr>
              <td><strong>Project Name</strong></td>
              <td> {projectName}</td>
            </tr>
            <tr>
              <td><strong>Unit Description</strong></td>
              <td> {unit}</td>
            </tr>
            <tr>
              <td><strong>Cash / Cheque</strong></td>
              <td> {paymentMethod}</td>
            </tr>
            <tr style={{ backgroundColor:'white', color:'black',maxHeight: '40px', overflow: 'hidden' }}>
              <td><strong>Cheque NO / P.O / TID NO</strong></td>
              <td><input type="text" name="poTidNo" style={{ maxHeight: '30px', width: '90%', textAlign: 'center' }} /></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div style={{ marginBottom: '20px' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', border: '1px solid black' }}>
          <thead>
            <tr>
              <th style={{ border: '1px solid black', padding: '8px' }}><strong>DESCRIPTION</strong></th>
              <th style={{ border: '1px solid black', padding: '8px' }}><strong>AMOUNT</strong></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style={{ border: '1px solid black', padding: '8px' }}><strong>TOTAL</strong></td>
              <td style={{ border: '1px solid black', padding: '8px' }}><strong>{amount}</strong></td>
            </tr>
            <tr>
              <td style={{ backgroundColor: 'white', color: 'black', border: '1px solid black', padding: '8px' }}><strong>In Word</strong></td>
              <td style={{ backgroundColor: 'white', color: 'black', border: '1px solid black', padding: '8px' }}><strong>{amountInWords} Taka Only</strong></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: '40px' }}>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p><strong>Client Signature</strong></p>
        </div>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p><strong>Accounts Signature</strong></p>
        </div>
        <div style={{ flex: '1', textAlign: 'center' }}>
          <hr style={{ width: '200px', marginBottom: '5px' }} />
          <p><strong>SPDL Management</strong></p>
        </div>
      </div>
      <div style={{ textAlign: 'center', marginTop: '40px' }}>
        <p>Received with thanks from <strong>Sarker Properties & Developments Ltd</strong></p>
        <h3>THANK YOU</h3>
      </div>
      <footer style={{ textAlign: 'center', marginTop: '20px', fontSize: '12px', borderTop: '1px solid #ccc', paddingTop: '10px' }}>
        <p>Office: House 41, Road Gareb-E-Newaz Avenue, Sector 11, Uttara, Dhaka-1230.</p>
      </footer>
    </div>
  );
};

export default CashMemo;
