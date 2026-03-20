import { defineConfig } from 'tailwindcss'

export default defineConfig({
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        archivo: ['"Archivo Black"', 'sans-serif'],
        bebas: ['"Bebas Neue"', 'sans-serif'],
        geologica: ['"Geologica"', 'sans-serif'],
        montserrat: ['"Montserrat"', 'sans-serif'],
        roboto: ['"Roboto"', 'sans-serif'],
      },
    },
  },
})