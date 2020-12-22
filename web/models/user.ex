defmodule Discuss.User do
  use Discuss.Web, :model

  schema "users" do
    field :full_name, :string
    field :email, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :email, :provider, :token])
    |> validate_required([:full_name, :email, :provider, :token])
  end

end