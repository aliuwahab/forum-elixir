defmodule Discuss.User do
  use Discuss.Web, :model

  @derive {Poison.Encoder, only: [:email]}

  schema "users" do
    field :full_name, :string
    field :email, :string
    field :provider, :string
    field :token, :string

    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :email, :provider, :token])
    |> validate_required([:full_name, :email, :provider, :token])
  end

end