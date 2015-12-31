defmodule Battlenet.Auth do
  def authorize_url do
    "#{site_url}/oauth/authorize?#{authorize_params}"
  end

  def token(code) do
    req_body = {:form, token_params(code)}
    req_options = [hackney: [basic_auth: basic_auth_credentials]]

    case HTTPoison.request(:post, token_url, req_body, [], req_options) do
      {:ok, %HTTPoison.Response{body: body}} ->
        body
        |> Poison.decode!()
        |> Dict.get("access_token")
    end
  end

  defp authorize_params do
    "client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=code"
  end

  defp token_params(code) do
    [code: code,
     grant_type: "authorization_code",
     redirect_uri: Dict.get(config, :redirect_uri)]
  end

  defp config, do: Application.get_all_env(:battlenet)

  defp basic_auth_credentials, do: {config[:client_id], config[:client_secret]}
  defp client_id, do: config[:client_id]
  defp redirect_uri, do: config[:redirect_uri]
  defp region, do: config[:region] || "eu"
  defp site_url, do: config[:site_url] || "https://#{region}.battle.net"
  defp token_url, do: "#{site_url}/oauth/token"
end
