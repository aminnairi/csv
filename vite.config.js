import elm from "vite-plugin-elm"

export default {
  plugins: [
    elm()
  ],
  server: {
    port: 8000,
    host: "0.0.0.0"
  }
}
