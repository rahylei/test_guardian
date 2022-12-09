defmodule AuthMe.UserManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AuthMe.UserManager` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password: "some password",
        username: "some username"
      })
      |> AuthMe.UserManager.create_user()

    user
  end
end
