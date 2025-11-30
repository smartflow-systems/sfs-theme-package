#!/bin/bash
# SFS Theme Setup for Replit
# Run this after uploading files to your Replit project

echo "🎨 SFS Theme Setup for Replit"
echo "================================"
echo ""

# Check if files exist in current directory
if [ ! -f "sfs-complete-theme.css" ]; then
    echo "❌ Error: sfs-complete-theme.css not found"
    echo "Make sure you've uploaded all theme files to this directory"
    exit 1
fi

echo "✅ Theme files found!"
echo ""

# Create assets folder if it doesn't exist
mkdir -p assets

# Copy logo files if assets folder exists in current dir
if [ -d "./assets" ] && [ -f "./assets/sfs-logo-square-128.png" ]; then
    echo "✅ Logo assets ready"
else
    echo "⚠️  Warning: Logo assets folder not found"
    echo "   Make sure to upload the 'assets' folder"
fi

echo ""
echo "📄 Creating example index.html..."

cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>SmartFlow Systems - Your App</title>
  <meta name="theme-color" content="#0D0D0D"/>

  <!-- SFS Theme -->
  <link rel="stylesheet" href="sfs-complete-theme.css"/>

  <!-- Favicon -->
  <link rel="icon" href="assets/favicon.ico"/>

  <!-- Custom Logo Styles -->
  <style>
    .sfs-fixed-logo {
      position: fixed;
      top: 15px;
      left: 15px;
      z-index: 1001;
      display: flex;
      align-items: center;
      justify-content: center;
      width: 56px;
      height: 56px;
      background: linear-gradient(135deg, #0D0D0D 0%, #1a1a1a 100%);
      border: 2px solid rgba(255, 215, 0, 0.4);
      border-radius: 12px;
      padding: 8px;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5), 0 0 20px rgba(255, 215, 0, 0.2);
    }

    .sfs-fixed-logo:hover {
      border-color: rgba(255, 215, 0, 0.8);
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.6), 0 0 30px rgba(255, 215, 0, 0.4);
      transform: translateY(-2px);
    }

    .sfs-fixed-logo img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }

    .sfs-hamburger-btn {
      top: 85px !important;
    }
  </style>
</head>
<body>
  <!-- Circuit Flow Background -->
  <canvas id="circuit-canvas"></canvas>

  <!-- SFS Logo (Top Left) -->
  <a href="/" class="sfs-fixed-logo">
    <img src="assets/sfs-logo-square-128.png" alt="SmartFlow Systems" />
  </a>

  <!-- Main Content -->
  <div class="container section">
    <h1 class="text-gold-gradient">Welcome to SmartFlow Systems</h1>
    <p class="lead">Your app is now using the complete SFS theme!</p>

    <div class="glass-card" style="margin-top: 2rem;">
      <h3>🎨 Theme Applied Successfully</h3>
      <p>This is a glass card with the marble effect.</p>
      <button class="btn btn-gold">Primary Button</button>
      <button class="btn btn-ghost" style="margin-left: 1rem;">Ghost Button</button>
    </div>

    <div class="glass-card" style="margin-top: 1rem;">
      <h4>Features Included:</h4>
      <ul>
        <li>✅ Black/Brown/Gold color scheme</li>
        <li>✅ Glass marble card effects</li>
        <li>✅ Circuit flow animated background</li>
        <li>✅ Hamburger navigation menu</li>
        <li>✅ SFS logo in top left</li>
        <li>✅ Responsive design</li>
      </ul>
    </div>
  </div>

  <!-- Scripts -->
  <script src="sfs-circuit-flow.js"></script>
  <script src="sfs-hamburger-menu.js"></script>
</body>
</html>
EOF

echo "✅ index.html created!"
echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps:"
echo "1. Open index.html in your browser"
echo "2. You should see:"
echo "   - Deep black background"
echo "   - Circuit flow animation"
echo "   - SFS logo in top left"
echo "   - Hamburger menu"
echo "   - Glass cards with gold accents"
echo ""
echo "📝 Customize your content in index.html"
