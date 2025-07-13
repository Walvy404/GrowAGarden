import React, { useState, useEffect } from 'react';
import './NotificationComponent.css';

const NotificationComponent = ({
  title = "Walvy Comunity",
  status = "Key Valid",
  autoHide = true,
  duration = 5000,
  onClose
}) => {
  const [isVisible, setIsVisible] = useState(true);
  const [isAnimating, setIsAnimating] = useState(false);

  useEffect(() => {
    if (autoHide) {
      const timer = setTimeout(() => {
        handleClose();
      }, duration);

      return () => clearTimeout(timer);
    }
  }, [autoHide, duration]);

  const handleClose = () => {
    setIsAnimating(true);
    setTimeout(() => {
      setIsVisible(false);
      if (onClose) onClose();
    }, 300);
  };

  if (!isVisible) return null;

  return (
    <div className="notification-wrapper">
      <div className="background-pattern"></div>

      <div className="upload-circle">
        <svg className="upload-arrow" viewBox="0 0 24 24">
          <path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z"/>
        </svg>
      </div>

      <div className={`notification-container ${isAnimating ? 'fade-out' : ''}`}>
        <div className="notification">
          <div className="notification-header">
            <div className="notification-icon">
              <svg className="icon-symbol" viewBox="0 0 24 24">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
              </svg>
            </div>
            <div className="notification-content">
              <div className="notification-title">{title}</div>
              <div className="notification-status">{status}</div>
            </div>
            <button className="notification-close" onClick={handleClose}>×</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default NotificationComponent;