defmodule Battlenet.UserTest do
  use ExUnit.Case

  test "default struct" do
    user = %Battlenet.User{}
    assert user.id == nil
    assert user.battletag == nil
  end
end
