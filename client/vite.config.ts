import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    // Forward API calls to the backend. The browser only talks to Vite,
    // so it works in Codespaces and needs no CORS.
    proxy: {
      '/api': 'http://localhost:5151',
    },
    allowedHosts: ['.app.github.dev'], // allow Codespaces' forwarded address
  },
});
