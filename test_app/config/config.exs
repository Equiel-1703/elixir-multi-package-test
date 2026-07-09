import Config

# This config is only to keep ElixirLS happy. The end user should
# provide it's own config file. The DummyBackend is just a placeholder
# to avoid compilation errors on development.
config :test_app, backend: TestApp.DummyBackend
