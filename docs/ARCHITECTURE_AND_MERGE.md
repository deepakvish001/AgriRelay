# AgriRelay architecture and merge guide

AgriRelay coordinates crop planning, pooled input procurement, shared machinery, collection centres, produce lots, cold-chain pickup, buyer offers and settlements for farmer cooperatives.

## Invariants

- Every operational record is scoped by `cooperative_id`.
- PostgreSQL row-level security is a mandatory second tenant boundary.
- Spatial decisions use PostGIS geography types.
- Commands are idempotent; integrations publish through an outbox.
- Financial settlements remain auditable and deterministic.

## Merge order

Merge by the three-digit branch prefix, not by GitHub PR number:

1. `001–024`: domain model
2. `025–043`: planning policies
3. `044–048`: security
4. `049–058`: persistence ports
5. `059–068`: application contexts
6. `069–084`: HTTP contracts and controllers
7. `085–096`: LiveView components
8. `097–108`: tests
9. `109–110`: database and tenant isolation
10. `111–118`: infrastructure and eventing
11. `119–120`: CI and architecture documentation

Run `mix format --check-formatted && mix test` after each group and resolve conflicts against the latest `main` before merging the next group.
