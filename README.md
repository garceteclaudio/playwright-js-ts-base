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