import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :auth_me, AuthMe.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "database",
  database: "auth_me_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auth_me, AuthMeWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 4002],
  secret_key_base: "cCETdFbZCUvswYWTByhNLSTFDRLm0Y5UQ970/3du0++6PgxMoaX9bCUsW+OnHloS",
  server: false

# In test we don't send emails.
config :auth_me, AuthMe.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
