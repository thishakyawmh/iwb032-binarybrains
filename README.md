# BinaryBrains — PlanAI Prototype

This repository contains a student project prototype with a web frontend and a Ballerina/MongoDB plans API.

## Repository layout

- `backend/` — primary Ballerina service for plan CRUD operations.
- `src/`, `index.html`, `new-plan.html`, `output.html` — browser frontend and Gemini integration.
- `ballerinaproect/` — legacy/alternate Ballerina project copy. It is not the documented primary API; compare it with `backend/` before using or deploying it.

## Prerequisites

- Ballerina distribution compatible with the version declared in `backend/Ballerina.toml` (2201.10.1).
- MongoDB reachable by the backend.
- Node.js and npm for the frontend.

## Run the backend

1. Copy `backend/Config.toml.example` to `backend/Config.toml`.
2. Set the MongoDB host/port and the exact frontend origin in that file.
3. From the `backend` directory, run:

   ```bash
   bal build
   bal run
   ```

The plans service listens on port 9090. The current implementation uses the MongoDB database `Plans_DB` and collection `Plans`.

## Run the frontend

```bash
npm install
npm run dev
```

## Configuration and security

- CORS now uses the configurable `allowedOrigins` list. Add the deployed frontend's exact origin to `backend/Config.toml`; do not use a wildcard in production.
- The plans API currently has **no user authentication or resource-level authorization**. Anyone who can reach it may be able to read, create, or modify plans. CORS is not authentication. Keep it on a trusted development network until authentication and authorization are implemented.
- The MongoDB connection currently uses host/port configuration without documented credentials or TLS settings. Add managed credentials and TLS before any production deployment.
- `src/index.js` uses a placeholder Gemini key and the HTML pages use a placeholder Google Maps key. Do not commit real API keys. Gemini requests should be proxied through a server-side endpoint; restrict any browser Maps key by HTTP referrer and API scope.
- The current frontend includes direct third-party integrations and is a prototype, not a production multi-user system.

## Tests

The existing Ballerina test file still references a `/greeting` resource that is not present in the current `backend/service.bal` plans service. Update the tests to exercise the actual plans API and run them with `bal test` before relying on them.
