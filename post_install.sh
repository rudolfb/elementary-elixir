# Add asdf plugins
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

# Erlang
asdf install erlang 22.2.1
asdf global erlang 22.2.1

# Elixir
asdf install elixir 1.9.4-otp-22
asdf global elixir 1.9.4-otp-22

# Phoenix
mix do local.hex --force , \
     local.rebar --force , \

