#!/bin/bash
set -euo pipefail

# ==============================================================================
# SFS THEME MASTER PACKAGE - AUTOMATED SETUP
# ==============================================================================
# This script automatically applies the complete SmartFlow Systems theme
# to your project. Run from your project root directory.
#
# Usage: bash /home/garet/SFS-THEME-MASTER-PACKAGE/SETUP.sh
# ==============================================================================

THEME_PACKAGE="/home/garet/SFS-THEME-MASTER-PACKAGE"
PROJECT_ROOT="$(pwd)"

echo "🎨 ==============================================="
echo "   SFS THEME MASTER PACKAGE - AUTO SETUP"
echo "   ==============================================="
echo ""
echo "📍 Project: $PROJECT_ROOT"
echo "📦 Theme Package: $THEME_PACKAGE"
echo ""

# ==============================================================================
# STEP 1: Create folder structure
# ==============================================================================
echo "📁 Step 1: Creating folder structure..."
mkdir -p "$PROJECT_ROOT/assets"
mkdir -p "$PROJECT_ROOT/css" 2>/dev/null || true
mkdir -p "$PROJECT_ROOT/public/assets" 2>/dev/null || true
echo "   ✅ Folders created"

# ==============================================================================
# STEP 2: Copy CSS files
# ==============================================================================
echo ""
echo "🎨 Step 2: Copying CSS theme files..."
cp "$THEME_PACKAGE/css/sfs-complete-theme.css" "$PROJECT_ROOT/" 2>/dev/null || true
cp "$THEME_PACKAGE/css/sfs-complete-theme.css" "$PROJECT_ROOT/css/" 2>/dev/null || true
cp "$THEME_PACKAGE/sfs-theme-config.json" "$PROJECT_ROOT/" 2>/dev/null || true
echo "   ✅ sfs-complete-theme.css copied"
echo "   ✅ sfs-theme-config.json copied"

# ==============================================================================
# STEP 3: Copy JavaScript files
# ==============================================================================
echo ""
echo "⚡ Step 3: Copying JavaScript files..."
cp "$THEME_PACKAGE/js/sfs-circuit-flow.js" "$PROJECT_ROOT/" 2>/dev/null || true
cp "$THEME_PACKAGE/js/sfs-hamburger-menu.js" "$PROJECT_ROOT/" 2>/dev/null || true
echo "   ✅ sfs-circuit-flow.js copied"
echo "   ✅ sfs-hamburger-menu.js copied"

# ==============================================================================
# STEP 4: Copy logo assets
# ==============================================================================
echo ""
echo "🖼️  Step 4: Copying logo assets..."
cp "$THEME_PACKAGE/assets/"* "$PROJECT_ROOT/assets/" 2>/dev/null || true
cp "$THEME_PACKAGE/assets/"* "$PROJECT_ROOT/public/assets/" 2>/dev/null || true
echo "   ✅ Logo files copied to assets/"
echo "   ✅ Logo files copied to public/assets/"

# ==============================================================================
# STEP 5: Check for index.html and update if needed
# ==============================================================================
echo ""
echo "📄 Step 5: Checking index.html..."

if [ -f "$PROJECT_ROOT/index.html" ]; then
  # Check if theme is already linked
  if grep -q "sfs-complete-theme.css" "$PROJECT_ROOT/index.html"; then
    echo "   ℹ️  Theme already linked in index.html"
  else
    echo "   ⚠️  Theme not linked - you need to manually add:"
    echo "      <link rel=\"stylesheet\" href=\"sfs-complete-theme.css\"/>"
    echo "      <canvas id=\"circuit-canvas\"></canvas>"
    echo "      <script src=\"sfs-circuit-flow.js\"></script>"
    echo "      <script src=\"sfs-hamburger-menu.js\"></script>"
  fi

  # Check if logo is present
  if grep -q "sfs-fixed-logo" "$PROJECT_ROOT/index.html"; then
    echo "   ℹ️  Logo already present in index.html"
  else
    echo "   ⚠️  Logo not found - you need to manually add:"
    echo "      <a href=\"/\" class=\"sfs-fixed-logo\">"
    echo "        <img src=\"assets/sfs-logo-square-128.png\" alt=\"SmartFlow Systems\" />"
    echo "      </a>"
  fi
else
  echo "   ⚠️  index.html not found in project root"
  echo "   ℹ️  Creating example index.html..."

  cat > "$PROJECT_ROOT/index.html" << 'EOF'
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
  <link rel="icon" type="image/png" sizes="192x192" href="assets/app-icon-192.png"/>
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
  </div>

  <!-- Scripts -->
  <script src="sfs-circuit-flow.js"></script>
  <script src="sfs-hamburger-menu.js"></script>
</body>
</html>
EOF

  echo "   ✅ Example index.html created"
fi

# ==============================================================================
# STEP 6: Create or update styles.css with logo CSS
# ==============================================================================
echo ""
echo "💅 Step 6: Setting up logo styles..."

if [ ! -f "$PROJECT_ROOT/styles.css" ]; then
  cat > "$PROJECT_ROOT/styles.css" << 'EOF'
/* Custom styles for your app */

/* SFS Fixed Logo (Top Left) */
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
  box-shadow:
    0 4px 12px rgba(0, 0, 0, 0.5),
    0 0 20px rgba(255, 215, 0, 0.2);
}

.sfs-fixed-logo:hover {
  border-color: rgba(255, 215, 0, 0.8);
  box-shadow:
    0 6px 16px rgba(0, 0, 0, 0.6),
    0 0 30px rgba(255, 215, 0, 0.4);
  transform: translateY(-2px);
}

.sfs-fixed-logo img {
  width: 100%;
  height: 100%;
  object-fit: contain;
}

/* Move hamburger menu below logo */
.sfs-hamburger-btn {
  top: 85px !important;
}

/* Mobile adjustments */
@media (max-width: 768px) {
  .sfs-fixed-logo {
    width: 48px;
    height: 48px;
    top: 12px;
    left: 12px;
  }

  .sfs-hamburger-btn {
    top: 72px !important;
    left: 15px !important;
  }
}
EOF

  echo "   ✅ styles.css created with logo styles"
else
  # Check if logo styles already exist
  if grep -q "sfs-fixed-logo" "$PROJECT_ROOT/styles.css"; then
    echo "   ℹ️  Logo styles already present in styles.css"
  else
    echo "   ⚠️  Logo styles not found in existing styles.css"
    echo "   ℹ️  You may want to add the .sfs-fixed-logo CSS manually"
  fi
fi

# ==============================================================================
# STEP 7: Summary
# ==============================================================================
echo ""
echo "🎉 ==============================================="
echo "   SETUP COMPLETE!"
echo "   ==============================================="
echo ""
echo "✅ Theme files copied"
echo "✅ Logo assets installed"
echo "✅ JavaScript files ready"
echo ""
echo "📋 NEXT STEPS:"
echo ""
echo "1. Open your index.html and verify these are included:"
echo "   • <link rel=\"stylesheet\" href=\"sfs-complete-theme.css\"/>"
echo "   • <canvas id=\"circuit-canvas\"></canvas>"
echo "   • <script src=\"sfs-circuit-flow.js\"></script>"
echo "   • <script src=\"sfs-hamburger-menu.js\"></script>"
echo ""
echo "2. Verify the logo is in your HTML:"
echo "   • <a href=\"/\" class=\"sfs-fixed-logo\">"
echo "     <img src=\"assets/sfs-logo-square-128.png\" alt=\"SmartFlow Systems\" />"
echo "     </a>"
echo ""
echo "3. Test your app:"
echo "   • Background should be deep black (#0D0D0D)"
echo "   • Circuit flow animation should be running"
echo "   • Logo should appear in top left with gold border"
echo "   • Hamburger menu should slide from left"
echo ""
echo "📚 Full documentation: $THEME_PACKAGE/README.md"
echo ""
echo "✨ Your app now has the complete SFS family theme!"
echo "==============================================="
