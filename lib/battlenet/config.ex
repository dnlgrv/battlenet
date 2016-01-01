defmodule Battlenet.Config do
  def api_site_url do
    config[:api_site_url] || "https://#{region}.api.battle.net"
  end

  def client_id, do: config[:client_id]
  def client_secret, do: config[:client_secret]
  def redirect_uri, do: config[:redirect_uri]

  def region do
    config[:region] || "eu"
  end

  def site_url do
    config[:site_url] || "https://#{region}.battle.net"
  end

  defp config, do: Application.get_all_env(:battlenet)
end
