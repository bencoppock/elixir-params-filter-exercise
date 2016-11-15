defmodule Params do
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
end
