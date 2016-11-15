# Overview

Just a fun little Elixir exercise!

1. [Install Elixir](http://elixir-lang.org/install.html)
1. Clone this repo
1. Run `mix test`
1. Run `iex -S mix` and type `h Params` for help
1. Get the tests passing!

## The Challenge

When processing requests with a web server, we often need to filter sensitive
parameters from our server logs — we wouldn't want to accidentally store social
security numbers or passwords in plain text on our servers!

Usually these params will come into the server as JSON, but we'll skip that part
for now. The challenge is to get the tests passing and to utilize the
application config to determine which params to filter.

_Note: you may want to simplify the tests a bit as you get started. For example,
perhaps comment out the test in "params_test.exs" and work on getting just the
doc tests working first. Then, inside "params_test.exs", comment out everything
inside the `params` and `filtered_params` maps except for the password, and
uncomment a new params each time the tests are green again._
