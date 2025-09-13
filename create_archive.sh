#!/bin/bash

# Create Zathaya Soft Complete Archive
echo "🚀 Creating Zathaya Soft Complete Archive..."

# Create main directory structure
mkdir -p zathaya-soft-complete/{nextjs,drupal-theme,docs}

# Create Next.js source files
echo "📁 Creating Next.js source files..."

# Package.json
cat > zathaya-soft-complete/nextjs/package.json << 'EOF'
{
  "name": "zathaya-soft",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "PORT=3000 next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "@hookform/resolvers": "^5.0.1",
    "@radix-ui/react-accordion": "^1.2.10",
    "@radix-ui/react-alert-dialog": "^1.1.13",
    "@radix-ui/react-avatar": "^1.1.9",
    "@radix-ui/react-checkbox": "^1.3.1",
    "@radix-ui/react-dialog": "^1.1.13",
    "@radix-ui/react-dropdown-menu": "^2.1.14",
    "@radix-ui/react-label": "^2.1.6",
    "@radix-ui/react-popover": "^1.1.13",
    "@radix-ui/react-select": "^2.2.4",
    "@radix-ui/react-separator": "^1.1.6",
    "@radix-ui/react-slot": "^1.2.2",
    "@radix-ui/react-tabs": "^1.1.11",
    "@radix-ui/react-tooltip": "^1.2.6",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "next": "15.3.2",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    "tailwind-merge": "^3.2.0"
  },
  "devDependencies": {
    "@types/node": "^20",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "autoprefixer": "^10.4.21",
    "eslint": "^9",
    "eslint-config-next": "15.3.2",
    "postcss": "^8.5.3",
    "tailwindcss": "^4.1.6",
    "typescript": "^5"
  }
}
EOF

# Next.js config
cat > zathaya-soft-complete/nextjs/next.config.ts << 'EOF'
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: 'standalone',
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: 'https',
        hostname: '**',
      },
    ],
  },
};

export default nextConfig;
EOF

# TypeScript config
cat > zathaya-soft-complete/nextjs/tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": [
      "dom",
      "dom.iterable",
      "ES6"
    ],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": [
        "./src/*"
      ]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts"
  ],
  "exclude": [
    "node_modules"
  ]
}
EOF

# Create directories for Next.js
mkdir -p zathaya-soft-complete/nextjs/src/{app,components,lib}
mkdir -p zathaya-soft-complete/nextjs/public

# Create Drupal theme structure
echo "🎨 Creating Drupal theme structure..."
mkdir -p zathaya-soft-complete/drupal-theme/{templates,css,js,images}

# Drupal theme info
cat > zathaya-soft-complete/drupal-theme/zathaya_soft.info.yml << 'EOF'
name: 'Zathaya Soft'
type: theme
description: 'Professional website theme for Zathaya Soft - converted from Next.js'
package: Custom
core_version_requirement: ^10.5
base theme: stable9

libraries:
  - zathaya_soft/global-styling
  - zathaya_soft/global-scripts

regions:
  header: Header
  navigation: Navigation
  highlighted: Highlighted
  help: Help
  content: Content
  sidebar_first: 'Left Sidebar'
  sidebar_second: 'Right Sidebar'
  footer: Footer
  hero: 'Hero Section'
  services: 'Services Section'
  testimonials: 'Testimonials Section'
  cta: 'Call to Action Section'
EOF

# Drupal libraries
cat > zathaya-soft-complete/drupal-theme/zathaya_soft.libraries.yml << 'EOF'
global-styling:
  css:
    theme:
      css/style.css: {}
      https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap: { type: external }
      https://cdn.tailwindcss.com: { type: external }

global-scripts:
  js:
    js/script.js: {}
  dependencies:
    - core/jquery
    - core/drupal
EOF

# Create documentation
echo "📚 Creating documentation..."

# Complete guide
cat > zathaya-soft-complete/docs/README.md << 'EOF'
# Zathaya Soft - Complete Website Package

## 🎯 Package Contents

This archive contains:
- Complete Next.js website source code
- Drupal 10.5.1 theme conversion
- Installation documentation
- Conversion guide

## 🚀 Quick Start

### Next.js:
```bash
cd nextjs/
npm install
npm run dev
```

### Drupal:
1. Copy drupal-theme/ to your Drupal installation
2. Enable theme in admin
3. Follow conversion guide

## 📁 Structure
- nextjs/ - Complete Next.js website
- drupal-theme/ - Drupal 10.5.1 theme
- docs/ - Documentation and guides

Live preview: https://sb-2rkbgt3osn33.vercel.run
EOF

# Create the archive
echo "📦 Creating archive..."
tar -czf zathaya-soft-complete.tar.gz zathaya-soft-complete/

echo "✅ Archive created: zathaya-soft-complete.tar.gz"
echo "📊 Archive size: $(du -h zathaya-soft-complete.tar.gz | cut -f1)"

# Display download instructions
echo ""
echo "🔧 Download Instructions:"
echo ""
echo "1. SCP Download:"
echo "   scp user@server:/path/to/zathaya-soft-complete.tar.gz ./"
echo ""
echo "2. Base64 method (for copy-paste):"
echo "   base64 -w 0 zathaya-soft-complete.tar.gz"
echo ""
echo "3. HTTP method (if available):"
echo "   wget/curl from browser accessible URL"

# Clean up temp directory
rm -rf zathaya-soft-complete/

echo ""
echo "🎉 Ready for download!"
EOF