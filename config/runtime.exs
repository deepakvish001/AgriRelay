import Config
if config_env() == :prod do
  database_url = System.fetch_env!("DATABASE_URL")
  secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
  config :agri_relay, AgriRelay.Repo, url: database_url, pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
  config :agri_relay, AgriRelayWeb.Endpoint, server: true, http: [ip: {0,0,0,0}, port: String.to_integer(System.get_env("PORT") || "4000")], secret_key_base: secret_key_base
end
