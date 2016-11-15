defmodule ParamsTest do
  use ExUnit.Case
  doctest Params

  test "filters nested params per the \"filter_keys\" configuration" do
    params = %{
      "password" => "pass123",
      "user" => %{
        "name" => "Benjamin",
        "things" => [
          %{"SSN" => %{"first_three" => "123", "next_two" => "12", "and_the_rest" => "1234"}},
          %{"fav_color" => "we'll say orange"},
          "ooh, gnarly list!",
          %{"sauce" => "ketchup"},
          %{"secret|sauce" => "mustard"}
        ]
      }
    }

    filtered_params = Params.filter(params)

    assert filtered_params == %{
      "password" => "[FILTERED]",
      "user" => %{
        "name" => "Benjamin",
        "things"  => [
          %{"SSN"    => "[FILTERED]"},
          %{"fav_color" => "we'll say orange"},
          "ooh, gnarly list!",
          %{"sauce" => "ketchup"},
          %{"secret|sauce" => "[FILTERED]"}
        ]
      }
    }
  end
end
