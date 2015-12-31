defmodule Battlenet.User do
  defstruct id: nil, battletag: nil

  def with_token(access_token) do
    case HTTPoison.get(resource_url("account/user", access_token)) do
      {:ok, %HTTPoison.Response{body: body}} ->
        body
        |> Poison.decode!(as: Battlenet.User)
    end
  end

  defp api_url, do: config_api_site_url || "https://#{region}.api.battle.net"
  defp resource_url(path, access_token) do
    "#{api_url}/#{path}?access_token=#{access_token}"
  end

  defp config_api_site_url, do: Application.get_env(:battlenet, :api_site_url)
  defp region do
    Application.get_env(:battlenet, :region) || "eu"
  end
end
