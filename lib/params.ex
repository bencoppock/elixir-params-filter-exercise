defmodule Params do
  @filter_keys Application.get_env(:params, :filter_keys, []) |> Enum.map(&String.downcase/1)

  @moduledoc """
  Provides filtering of parameters specified in the application config.

  ## Configuration
  Specify the keys to filter within config.exs:

  ```
  config :params,
    filter_keys: ["password", "ssn", "secret|sauce"]
  ```

  ## More
  See `filter/1` for more
  """

  @doc """
  Accepts a map or a list

  ## Examples:

      iex> Params.filter(%{"name" => "Allie", "ssn" => "123-45-6789"})
      %{"name" => "Allie", "ssn" => "[FILTERED]"}

      iex> Params.filter([%{"name" => "Allie"}, %{"ssn" => "123-45-6789"}])
      [%{"name" => "Allie"}, %{"ssn" => "[FILTERED]"}]
  """
  def filter(params) when is_map(params) do
    params
    |> Enum.map(fn {key, value} -> filter(key, value) end)
    |> Enum.into(%{})
  end

  def filter(params) when is_list(params) do
    params
    |> Enum.map(fn param -> filter(param) end)
  end

  def filter(value) when is_binary(value), do: value

  def filter(key, value) do
    case Enum.member?(@filter_keys, String.downcase(key)) do
      true -> {key, "[FILTERED]"}
         _ -> {key, filter(value)}
    end
  end
end
