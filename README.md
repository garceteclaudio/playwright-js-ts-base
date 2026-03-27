# Playwright JS/TS Base Project

A foundational project template for end-to-end testing with Playwright using JavaScript and TypeScript. This setup includes the Page Object Model pattern, test fixtures, Docker support, and example test cases to get you started quickly.

## Prerequisites

- Node.js (version 16 or higher)
- npm or yarn
- Docker (optional, for containerized execution)

## Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd playwright-js-ts-base
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Install Playwright browsers:
   ```bash
   npx playwright install
   ```

## Project Structure

- `tests/` - Test files (.spec.ts, .js) containing the actual test cases
- `pages/` - Page Object Model classes that encapsulate page-specific logic and locators
- `fixtures/` - Test fixtures and shared setup, including `pageObjects.ts` which initializes the page objects (LoginPage and InventoryPage) used across all tests
- `playwright.config.ts` - Playwright configuration file
- `package.json` - Project dependencies and scripts
- `docker-compose.yml` - Docker Compose configuration for running tests in a container
- `Dockerfile` - Docker image definition

## Running Tests

### Run all tests locally
```bash
npx playwright test
```

### Run tests in a specific project (e.g., Chromium)
```bash
npx playwright test --project=chromium
```

### Run tests in interactive UI mode
```bash
npx playwright test --ui
```

### Run tests in debug mode
```bash
npx playwright test --debug
```

### Run a specific test file
```bash
npx playwright test tests/login-DI-1.spec.ts
```

## Docker

### Run tests in Docker container
```bash
docker-compose up
```

### Clean up Docker images and containers
To remove all containers, networks, and images created by Docker Compose:
```bash
docker-compose down --rmi all
```


## Reports

After running tests, view the HTML report:
```bash
npx playwright show-report
```

## Configuration

The project uses `playwright.config.ts` for configuration. You can modify browser settings, timeouts, and other options there.

## Contributing

1. Follow the Page Object Model pattern for new pages
2. Use fixtures for shared test setup
3. Write descriptive test names and comments

## Documentation

For more information about Playwright, visit [https://playwright.dev/docs/intro](https://playwright.dev/docs/intro)