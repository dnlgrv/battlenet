# Battlenet

[![Build Status](https://travis-ci.org/danielgrieve/battlenet.svg)](https://travis-ci.org/danielgrieve/battlenet)

Elixir library for the [Battle.net][1] API.

## Installation

Add `battlenet` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:battlenet, "~> 0.0.2"}]
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

  api_site_url: "override", # optional, defaults to <region>.api.battle.net
  region: "override", # optional, defaults to eu
  site_url: "override" # optional, defaults to <region>.battle.net

import_config "config.secret.exs"
```

```elixir
# config.secret.exs
use Mix.Config

config :battlenet,
  client_id: "your-client-id", # required
  client_secret: "your-client-secret", # required
```

It's worth reading [Blizzard's OAuth Documentation][3] to get familiar with how
it works.

## Task list

- [x] OAuth interactions
  - [x] Authorization URL
  - [x] Access token
  - [ ] Scopes
  - [ ] State verification
- [ ] API
  - [x] User profile (for Battle.net ID and Battletag)
  - [ ] Flexible API requests (any endpoint)

## License

See [LICENSE.md](LICENSE.md).

[1]: https://dev.battle.net
[2]: https://dev.battle.net/apps/mykeys
[3]: https://dev.battle.net/docs/read/oauth
