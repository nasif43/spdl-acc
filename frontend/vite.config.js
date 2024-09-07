import { defineConfig } from 'vite'
import dotenv from 'dotenv'
import preact from '@preact/preset-vite'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [preact()]
});
