import React, { useState } from 'react';
import NotificationComponent from './NotificationComponent';

function App() {
  const [showNotification, setShowNotification] = useState(false);

  const handleShowNotification = () => {
    setShowNotification(true);
  };

  const handleCloseNotification = () => {
    setShowNotification(false);
  };

  return (
    <div className="App">
      <div style={{ 
        height: '100vh', 
        display: 'flex', 
        justifyContent: 'center', 
        alignItems: 'center',
        backgroundColor: '#f0f0f0'
      }}>
        <button 
          onClick={handleShowNotification}
          style={{
            padding: '12px 24px',
            backgroundColor: '#4a7c59',
            color: 'white',
            border: 'none',
            borderRadius: '8px',
            fontSize: '16px',
            cursor: 'pointer',
            fontWeight: '600'
          }}
        >
          Show Walvy Comunity Notification
        </button>
      </div>

      {showNotification && (
        <NotificationComponent
          title="Walvy Comunity"
          status="Key Valid"
          autoHide={true}
          duration={5000}
          onClose={handleCloseNotification}
        />
      )}
    </div>
  );
}

export default App;