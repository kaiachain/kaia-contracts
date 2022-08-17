const { shouldSupportInterfaces } = require('./SupportsInterface.behavior');

const KIP13Mock = artifacts.require('KIP13Mock');

contract('KIP13', function () {
  beforeEach(async function () {
    this.mock = await KIP13Mock.new();
  });

  shouldSupportInterfaces(['KIP13']);
});
