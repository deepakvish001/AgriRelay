FROM hexpm/elixir:1.18.3-erlang-27.3-debian-bookworm-20250407 AS build
WORKDIR /app
COPY . .
RUN mix local.hex --force && mix local.rebar --force && MIX_ENV=prod mix deps.get && MIX_ENV=prod mix release

FROM debian:bookworm-slim
RUN useradd --system --uid 10001 agrirelay
USER agrirelay
COPY --from=build /app/_build/prod/rel/agri_relay /app
EXPOSE 4000
ENTRYPOINT ["/app/bin/agri_relay","start"]
