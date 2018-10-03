'use strict';
/**
 * Dependencies
 */
const fs = require("fs");
/**
 * Tests
 */
describe('LICENSE', () => {
  it('should contain the current year as the end year of the license', () => {
    const license = fs.readFileSync(`${process.cwd()}/LICENSE.md`, 'utf8');
    const currentYear= (new Date()).getFullYear();
    return expect(license.indexOf(`-${currentYear}`)).to.not.equal(-1);
  });
});
