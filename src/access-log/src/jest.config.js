/** @type {import('jest').Config} */
module.exports = {
  testEnvironment: 'node',
  // Default testRunner resolves to a filesystem path that breaks on Windows
  // containers (jest-circus\build\runner.js not found). Module id defers resolution.
  testRunner: 'jest-circus/runner',
};
