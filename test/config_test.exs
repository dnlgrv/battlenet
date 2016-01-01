defmodule Battlenet.ConfigTest do
  use ExUnit.Case

  alias Battlenet.Config

  setup do
    original_config = Application.get_all_env(:battlenet)
    clear_config()
    on_exit fn ->
      restore_config(original_config)
    end
    :ok
  end

  test "default values" do
    assert Config.api_site_url == "https://eu.api.battle.net"
    assert Config.region == "eu"
    assert Config.site_url == "https://eu.battle.net"
  end

  test "configurable values" do
    configure(:api_site_url, "http://test-api-site-url")
    configure(:client_id, "test-client-id")
    configure(:client_secret, "test-client-secret")
    configure(:redirect_uri, "test-redirect")
    configure(:region, "test-region")
    configure(:site_url, "http://test-site-url")

    assert Config.api_site_url == "http://test-api-site-url"
    assert Config.client_id == "test-client-id"
    assert Config.client_secret == "test-client-secret"
    assert Config.redirect_uri == "test-redirect"
    assert Config.region == "test-region"
    assert Config.site_url == "http://test-site-url"
  end

  defp clear_config do
    Application.get_all_env(:battlenet)
    |> Dict.keys()
    |> Enum.each(&(Application.delete_env(:battlenet, &1)))
  end

  defp configure(key, val) do
    Application.put_env(:battlenet, key, val)
  end

  defp restore_config(config) do
    config
    |> Enum.each(fn({key, val}) -> configure(key, val) end)
  end
end
