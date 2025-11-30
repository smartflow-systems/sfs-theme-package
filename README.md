# SFS Theme Package

**SmartFlow Systems Complete Theme Package**

Black/Brown/Gold design system with glass marble effects, circuit background animation, and hamburger navigation.

## Quick Start for Replit

```bash
# Clone this repository into your Replit project
git clone https://github.com/smartflow-systems/sfs-theme-package.git
cd sfs-theme-package

# Run the automated setup
bash setup-replit.sh
```

## What's Included

- **Complete CSS Theme** (`sfs-complete-theme.css`) - 14KB
- **Circuit Flow Animation** (`sfs-circuit-flow.js`) - 4KB
- **Hamburger Navigation** (`sfs-hamburger-menu.js`) - 11KB
- **SFS Logo Assets** (multiple sizes: 32px, 64px, 128px, 256px)
- **Favicon & App Icons**
- **Automated Setup Script** (`setup-replit.sh`)

## Theme Features

- Deep black background (#0D0D0D)
- Brown/gold accent color scheme
- Glass morphism cards with blur effects
- Animated circuit background (35 gold nodes)
- Fixed logo in top-left corner
- GitHub-style hamburger navigation menu
- Responsive design
- Smooth hover animations

## Colors

| Color | Hex | Usage |
|-------|-----|-------|
| SFS Black | `#0D0D0D` | Background |
| SFS Brown | `#3B2F2F` | Panels |
| SFS Gold | `#FFD700` | Accent |
| Beige | `#F5F5DC` | Text |
| Muted | `#9a8f80` | Subtle text |

## Installation

### Option 1: Automated Setup (Recommended)

```bash
bash setup-replit.sh
```

### Option 2: Manual Setup

1. Copy files to your project root:
   ```bash
   cp sfs-complete-theme.css /path/to/your/project/
   cp sfs-circuit-flow.js /path/to/your/project/
   cp sfs-hamburger-menu.js /path/to/your/project/
   cp -r assets /path/to/your/project/
   ```

2. Add to your HTML `<head>`:
   ```html
   <link rel="stylesheet" href="sfs-complete-theme.css"/>
   ```

3. Add to your HTML `<body>`:
   ```html
   <!-- Circuit Background -->
   <canvas id="circuit-canvas"></canvas>

   <!-- Logo -->
   <a href="/" class="sfs-fixed-logo">
     <img src="assets/sfs-logo-square-128.png" alt="SmartFlow Systems" />
   </a>

   <!-- Your Content -->
   <div class="container">
     <h1 class="text-gold-gradient">Your App</h1>
     <div class="glass-card">
       <p>Content here</p>
       <button class="btn btn-gold">Click Me</button>
     </div>
   </div>

   <!-- Scripts -->
   <script src="sfs-circuit-flow.js"></script>
   <script src="sfs-hamburger-menu.js"></script>
   ```

## Component Classes

### Cards
- `.glass-card` - Standard glass with blur
- `.sfs-glass-card` - Brown-tinted glass
- `.sfs-flow-card` - Enhanced marble effect

### Buttons
- `.btn .btn-gold` - Gold gradient primary button
- `.btn .btn-ghost` - Transparent ghost button

### Text
- `.text-gold-gradient` - Shimmering gold gradient text
- `.text-gold` - Solid gold color text

### Layout
- `.container` - Centered max-width 1280px
- `.section` - Standard vertical padding

## Verification Checklist

After installation, verify:

- [ ] Background is deep black (#0D0D0D)
- [ ] Circuit flow animation running
- [ ] SFS logo in top left with gold border
- [ ] Logo glows on hover
- [ ] Hamburger menu slides from left
- [ ] Cards have glass blur effect
- [ ] All accents are gold (#FFD700)
- [ ] Buttons have smooth animations
- [ ] Text is beige/parchment color

## Documentation

For detailed specifications, see:
- `CANVAS-DROP.txt` - Quick reference for Replit agents
- Source repository: [SmartFlowSite](https://github.com/smartflow-systems/SmartFlowSite)

## License

Part of the SmartFlow Systems family of applications.

## Support

For issues or questions, visit the [SmartFlow Systems organization](https://github.com/smartflow-systems).

---

**Version:** 2.0.0
**Last Updated:** 2025-11-30
