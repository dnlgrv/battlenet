defmodule Battlenet.Auth do
  alias Battlenet.Config

  def authorize_url do
    "#{Config.site_url}/oauth/authorize?#{authorize_params}"
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
    "client_id=#{Config.client_id}&redirect_uri=#{Config.redirect_uri}&response_type=code"
  end

  defp token_params(code) do
    [code: code,
     grant_type: "authorization_code",
     redirect_uri: Config.redirect_uri]
  end

  defp basic_auth_credentials, do: {Config.client_id, Config.client_secret}
  defp token_url, do: "#{Config.site_url}/oauth/token"
end
