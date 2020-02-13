# Add asdf plugins
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

# Erlang
asdf install erlang 22.2.6
asdf global erlang 22.2.6

# Elixir
asdf install elixir 1.10.1-otp-22
asdf global elixir 1.10.1-otp-22

# Phoenix
mix do local.hex --force , \
     local.rebar --force , \
     archive.install hex phx_new 1.4.13
