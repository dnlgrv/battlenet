defmodule Battlenet.User do
  defstruct id: nil, battletag: nil

  alias Battlenet.Config

  def with_token(access_token) do
    case HTTPoison.get(resource_url("account/user", access_token)) do
      {:ok, %HTTPoison.Response{body: body}} ->
        body
        |> Poison.decode!(as: Battlenet.User)
    end
  end

  defp resource_url(path, access_token) do
    "#{Config.api_site_url}/#{path}?access_token=#{access_token}"
  end
end
