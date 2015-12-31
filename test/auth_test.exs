defmodule Battlenet.AuthTest do
  use ExUnit.Case

  @config Application.get_all_env(:battlenet)

  test "authorize_url region" do
    parsed_url = URI.parse(Battlenet.Auth.authorize_url)

    assert parsed_url.scheme == "https"
    assert parsed_url.authority == "test.battle.net"
  end

  test "authorize_url params" do
    url = Battlenet.Auth.authorize_url

    assert query_param(url, "client_id") == @config[:client_id]
    assert query_param(url, "redirect_uri") == @config[:redirect_uri]
    assert query_param(url, "response_type") == "code"
  end

  defp query_param(url, param) do
    url
    |> URI.parse()
    |> Map.get(:query)
    |> URI.decode_query()
    |> Dict.get(param)
  end
end
