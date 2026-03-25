# Playwright JS/TS Base Project

This is a base project for end-to-end testing using Playwright with JavaScript/TypeScript. It includes page objects, locators, fixtures, and example test files.

## Prerequisites

- Node.js (version 16 or higher)
- npm or yarn

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

- `tests/` - Test files (.spec.ts, .js)
- `pages/` - Page Object Model classes
- `locators/` - JSON files with element selectors
- `fixtures/` - Test fixtures and shared setup
- `playwright.config.ts` - Playwright configuration
- `package.json` - Project dependencies and scripts

## Running Tests

### Run all tests
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

## Running Tests with Docker

### Using Docker Compose (Recommended)

To run tests in a containerized environment using Docker Compose:

```bash
docker-compose up
```

This will:
- Build the Docker image from the Dockerfile
- Run all tests inside a container
- Mount local `reports/` and `test-results/` directories for result persistence
- Automatically clean up the container after execution

To rebuild the image and run tests:
```bash
docker-compose up --build
```

To run tests without stopping the container:
```bash
docker-compose run playwright npx playwright test
```

### Using Docker directly

Build the Docker image:
```bash
docker build -t playwright-tests .
```

Run all tests:
```bash
docker run --rm -v %cd%/reports:/app/reports -v %cd%/test-results:/app/test-results playwright-tests
```

Run tests in a specific browser:
```bash
docker run --rm -v %cd%/reports:/app/reports -v %cd%/test-results:/app/test-results playwright-tests npx playwright test --project=chromium
```

Run tests in interactive mode:
```bash
docker run -it --rm -v %cd%/reports:/app/reports -v %cd%/test-results:/app/test-results playwright-tests npx playwright test --ui
```

**Note:** On macOS/Linux, replace `%cd%` with `$(pwd)` in the docker run commands.

## Code Generation

To auto-generate tests using Playwright's codegen tool:
```bash
npx playwright codegen
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
2. Store locators in JSON files under `locators/`
3. Use fixtures for shared test setup
4. Write descriptive test names and comments

## Documentation

For more information about Playwright, visit [https://playwright.dev/docs/intro](https://playwright.dev/docs/intro)