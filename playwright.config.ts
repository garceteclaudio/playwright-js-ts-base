import { defineConfig, devices } from '@playwright/test';

const now = new Date();
const dd = String(now.getDate()).padStart(2, '0');
const mm = String(now.getMonth() + 1).padStart(2, '0');
const aa = String(now.getFullYear()).slice(-2);
const hh = String(now.getHours()).padStart(2, '0');
const min = String(now.getMinutes()).padStart(2, '0');
const ss = String(now.getSeconds()).padStart(2, '0');
const timestamp = `${dd}-${mm}-${aa}-${hh}-${min}-${ss}`;

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  
  //Máximo de  workers en paralelo
  workers: 4,

  reporter: [['html', { 
    outputFolder: `${timestamp}-playwright-report`,
    open: 'never' 
  }]],
  use: {
    // false para ver el navegador en acción, true para ejecutar en modo headless
    headless: true,
    trace: 'on',
    screenshot: 'on',
    video: 'on',
  },

  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
});
