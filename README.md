# Battlenet

Elixir library for the [Battle.net][1] API.

## Installation

Add `battlenet` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:battlenet, "~> 0.1"}]
end
```

And add to your application list in `mix.exs`:

```elixir
def application do
  [applications: [:battlenet]]
end
```

## Configuration

You will need to provide your `client_id`, `client_secret`, and `redirect_uri`.
The `client_id` and `client_secret` can be found on the [My API Keys][2] page,
and `redirect_uri` is the one you provided when you created your battle.net
application.

It's recommended that you create a secret configuration file that you don't
check into source control to provide your `client_id` and `client_secret`.

```elixir
# config.exs
use Mix.Config

config :battlenet,
  redirect_uri: "your-redirect-uri", # required
  site_url: "override-site-url", # optional, defaults to <region>.battle.net
  region: "override-region" # optional, defaults to eu

import_config "config.secret.exs"
```

```elixir
# config.secret.exs
use Mix.Config

config :battlenet,
  client_id: "your-client-id", # required
  client_secret: "your-client-secret", # required
```

## Task list

- [x] OAuth interactions
  - [x] Authorization URL
  - [x] Access token
- [ ] API
  - [ ] User profile (for Battle.net ID and Battletag)

## License

See [LICENSE.md](LICENSE.md).

[1]: https://dev.battle.net
[2]: https://dev.battle.net/apps/mykeys
