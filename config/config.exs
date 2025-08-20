import Config

config :fladan,
  ecto_repos: [Fladan.Repo],
  generators: [timestamp_type: :utc_datetime],
  skip_migration: false

# Configures the endpoint
config :fladan, FladanWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: FladanWeb.ErrorHTML, json: FladanWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Fladan.PubSub,
  live_view: [signing_salt: "XuOO2iFL"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :fladan, Fladan.Mailer, adapter: Swoosh.Adapters.Local

config :esbuild,
  version: "0.25.4",
  fladan: [
    args:
      ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/* --alias:@=.),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => [Path.expand("../deps", __DIR__), Mix.Project.build_path()]}
  ]

config :tailwind,
  version: "4.1.7",
  fladan: [
    args: ~w(
      --input=assets/css/app.css
      --output=priv/static/assets/css/app.css
    ),
    cd: Path.expand("..", __DIR__)
  ]

config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
