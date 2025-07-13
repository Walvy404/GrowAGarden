// Key System functionality
document.addEventListener('DOMContentLoaded', function() {
    const keyInput = document.getElementById('keyInput');
    const lootlabsBtn = document.getElementById('lootlabsBtn');
    const linkvertiseBtn = document.getElementById('linkvertiseBtn');
    const checkKeyBtn = document.getElementById('checkKeyBtn');
    const menuBtns = document.querySelectorAll('.menu-btn');
    
    // Valid keys for demonstration
    const validKeys = [
        'REDKEY2024',
        'LIMITHUB-RED',
        'REDTHEME-KEY',
        'NEWKEY-RED123'
    ];
    
    // Menu button functionality
    menuBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            menuBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Add some feedback
            showNotification(`Switched to ${this.textContent}`);
        });
    });
    
    // Lootlabs button functionality
    lootlabsBtn.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
        
        showNotification('Redirecting to Lootlabs...');
        
        // Simulate redirect delay
        setTimeout(() => {
            window.open('https://lootlabs.gg/', '_blank');
        }, 1000);
    });
    
    // Linkvertise button functionality
    linkvertiseBtn.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
        
        showNotification('Redirecting to Linkvertise...');
        
        // Simulate redirect delay
        setTimeout(() => {
            window.open('https://linkvertise.com/', '_blank');
        }, 1000);
    });
    
    // Check key functionality
    checkKeyBtn.addEventListener('click', function() {
        const enteredKey = keyInput.value.trim();
        
        if (!enteredKey) {
            showNotification('Please enter a key first!', 'error');
            keyInput.focus();
            return;
        }
        
        // Add loading state
        this.textContent = 'Checking...';
        this.disabled = true;
        
        // Simulate checking delay
        setTimeout(() => {
            if (validKeys.includes(enteredKey)) {
                showNotification('Key is valid! Access granted.', 'success');
                keyInput.style.borderColor = '#00ff00';
                keyInput.style.boxShadow = '0 0 15px rgba(0, 255, 0, 0.3)';
                
                // Simulate successful key activation
                setTimeout(() => {
                    showNotification('Hub activated successfully!', 'success');
                    // You could redirect or enable features here
                }, 1000);
            } else {
                showNotification('Invalid key! Please try again.', 'error');
                keyInput.style.borderColor = '#ff0000';
                keyInput.style.boxShadow = '0 0 15px rgba(255, 0, 0, 0.5)';
                keyInput.value = '';
            }
            
            // Reset button
            this.textContent = 'Check Key';
            this.disabled = false;
        }, 2000);
    });
    
    // Key input functionality
    keyInput.addEventListener('input', function() {
        // Reset border color when typing
        this.style.borderColor = 'rgba(255, 0, 0, 0.5)';
        this.style.boxShadow = '';
    });
    
    // Enter key to check
    keyInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            checkKeyBtn.click();
        }
    });
    
    // Shop button functionality
    const shopBtn = document.querySelector('.shop-btn');
    shopBtn.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
        
        showNotification('Opening shop...');
    });
    
    // Grow All button functionality
    const growBtn = document.querySelector('.grow-btn');
    growBtn.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
        
        showNotification('Growing all plants...');
        
        // Simulate growing animation
        setTimeout(() => {
            showNotification('All plants grown successfully!', 'success');
        }, 1500);
    });
    
    // Tool items hover effects
    const toolItems = document.querySelectorAll('.tool-item');
    toolItems.forEach(item => {
        item.addEventListener('click', function() {
            const toolName = this.querySelector('.tool-name').textContent;
            showNotification(`Selected: ${toolName}`);
        });
    });
    
    // Notification system
    function showNotification(message, type = 'info') {
        // Remove existing notifications
        const existingNotifications = document.querySelectorAll('.notification');
        existingNotifications.forEach(n => n.remove());
        
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.textContent = message;
        
        // Style the notification
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 25px;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            font-size: 14px;
            z-index: 1000;
            opacity: 0;
            transform: translateX(300px);
            transition: all 0.3s ease;
            max-width: 300px;
            backdrop-filter: blur(10px);
        `;
        
        // Set colors based on type
        switch(type) {
            case 'success':
                notification.style.background = 'linear-gradient(135deg, #00aa00, #006600)';
                notification.style.border = '2px solid #00ff00';
                break;
            case 'error':
                notification.style.background = 'linear-gradient(135deg, #cc0000, #990000)';
                notification.style.border = '2px solid #ff0000';
                break;
            default:
                notification.style.background = 'linear-gradient(135deg, #ff6600, #cc4400)';
                notification.style.border = '2px solid #ff8800';
        }
        
        document.body.appendChild(notification);
        
        // Animate in
        setTimeout(() => {
            notification.style.opacity = '1';
            notification.style.transform = 'translateX(0)';
        }, 10);
        
        // Auto remove after 3 seconds
        setTimeout(() => {
            notification.style.opacity = '0';
            notification.style.transform = 'translateX(300px)';
            setTimeout(() => {
                notification.remove();
            }, 300);
        }, 3000);
    }
    
    // Add some dynamic effects to the background
    function addDynamicEffects() {
        const background = document.querySelector('.background');
        
        // Add floating particles
        for (let i = 0; i < 10; i++) {
            const particle = document.createElement('div');
            particle.style.cssText = `
                position: absolute;
                width: 4px;
                height: 4px;
                background: rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                animation: float ${5 + Math.random() * 5}s ease-in-out infinite;
                left: ${Math.random() * 100}%;
                top: ${Math.random() * 100}%;
                animation-delay: ${Math.random() * 5}s;
            `;
            background.appendChild(particle);
        }
        
        // Add CSS for floating animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes float {
                0%, 100% { transform: translateY(0px) rotate(0deg); }
                50% { transform: translateY(-20px) rotate(180deg); }
            }
        `;
        document.head.appendChild(style);
    }
    
    // Initialize dynamic effects
    addDynamicEffects();
    
    // Welcome message
    setTimeout(() => {
        showNotification('Welcome to Red Theme Key System!');
    }, 1000);
    
    // Show example key hint after 5 seconds
    setTimeout(() => {
        showNotification('Hint: Try "REDKEY2024" as an example key');
    }, 5000);
});