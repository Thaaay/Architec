module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/javascript/**/*.ts',
    './app/javascript/**/*.tsx'
  ],
  theme: {
    extend: {
      colors: {
        nordik: {
          bg: '#826e57ff',        // Fundo da página (Bege claro)
          white: '#d7c3a8ff',     // Fundo dos Cards
          primary: '#3D3D3D',   // Texto principal (Cinza escuro)
          secondary: '#7A7A7A', // Texto secundário (Cinza médio)
          accent: '#B8A996',    // Botões e Detalhes (Marrom suave)
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      }
    },
  },
  plugins: [],
}