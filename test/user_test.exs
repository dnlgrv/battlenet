defmodule Battlenet.UserTest do
  use ExUnit.Case

  test "default struct" do
    user = %Battlenet.User{}
    assert user.id == nil
    assert user.battletag == nil
  end

  test "retrieving user with access token" do
    bypass = Bypass.open

    Bypass.expect bypass, fn conn ->
      assert conn.request_path == "/account/user"
      assert conn.method == "GET"

      Plug.Conn.resp(conn, 200, "{\"id\": \"user-id\", \"battletag\": \"User#1234\"}")
    end

    expected_user = %Battlenet.User{id: "user-id", battletag: "User#1234"}

    Application.put_env(:battlenet, :api_site_url, "http://localhost:#{bypass.port}")
    Battlenet.User.with_token("a-token") == expected_user
    Application.delete_env(:battlenet, :api_site_url)
  end
end
