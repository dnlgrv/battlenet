defmodule Battlenet.Auth do
  def authorize_url do
    "https://#{region}.battle.net/oauth/authorize?#{authorize_params}"
  end

  defp authorize_params do
    "client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code"
  end

  defp client_id, do: config[:client_id]
  defp config, do: Application.get_all_env(:battlenet)
  defp redirect_uri, do: config[:redirect_uri]
  defp region, do: config[:region] || "eu"
end
