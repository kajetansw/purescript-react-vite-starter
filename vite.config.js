import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { ViteEjsPlugin } from 'vite-plugin-ejs'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    ViteEjsPlugin((config) => ({
      isDev: config.mode === 'development'
    })),
  ],
  server: {
    port: 8080
  },
})
