# Walvy Comunity Notification UI

A modern notification component inspired by the design shown in the reference image, with "Walvy Comunity" branding.

## Features

- 🎨 Modern glassmorphism design
- ✨ Smooth slide-in/fade-out animations
- 🔄 Auto-hide functionality (configurable)
- 📱 Responsive design
- ⚛️ Available in both HTML and React versions
- 🎯 Customizable title, status, and timing

## Files Included

1. **`notification.html`** - Standalone HTML version with embedded CSS and JavaScript
2. **`NotificationComponent.jsx`** - React component
3. **`NotificationComponent.css`** - CSS styles for React component
4. **`App.jsx`** - Example usage of the React component

## HTML Version Usage

Simply open `notification.html` in your browser. The notification will automatically appear after 500ms and auto-hide after 5 seconds. You can also click the "Show Notification" button to trigger it manually.

## React Version Usage

```jsx
import NotificationComponent from './NotificationComponent';

function App() {
  const [showNotification, setShowNotification] = useState(false);

  return (
    <div>
      <button onClick={() => setShowNotification(true)}>
        Show Notification
      </button>

      {showNotification && (
        <NotificationComponent
          title="Walvy Comunity"
          status="Key Valid"
          autoHide={true}
          duration={5000}
          onClose={() => setShowNotification(false)}
        />
      )}
    </div>
  );
}
```

## Props (React Component)

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `title` | string | "Walvy Comunity" | The main title of the notification |
| `status` | string | "Key Valid" | The status text shown below the title |
| `autoHide` | boolean | `true` | Whether to auto-hide the notification |
| `duration` | number | `5000` | Auto-hide duration in milliseconds |
| `onClose` | function | - | Callback function when notification is closed |

## Design Elements

- **Background**: Green gradient with subtle dot pattern
- **Upload Circle**: Circular element with arrow icon
- **Notification**: Dark glass card with blue accent icon
- **Typography**: Clean, modern fonts with proper hierarchy
- **Animations**: Smooth transitions and micro-interactions

## Customization

You can easily customize:
- Colors by modifying the CSS variables
- Animation timing and easing
- Size and positioning
- Icons and content
- Auto-hide behavior

## Browser Support

- Modern browsers supporting CSS Grid, Flexbox, and CSS animations
- Backdrop filter support for glassmorphism effect
- SVG support for icons

## Installation (React)

1. Copy the component files to your project
2. Import the component and CSS
3. Use the component in your JSX

No additional dependencies required - uses only React and CSS.