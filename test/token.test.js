// Load dependencies
const { expect } = require('chai');

// Load compiled artifacts
const Token = artifacts.require('Token');

// Write test for contracts\token.sol
// Start test block
describe('Token', function () {
	beforeEach(async function () {
		// Deploy a new Token contract for each test
		this.token = await Token.new();
	});

	// Test case
	it('has a name', async function () {
		// Use large integer comparisons
		expect(await this.token.name()).to.equal('DApp Token');
	});

	it('has a symbol', async function () {
		expect(await this.token.symbol()).to.equal('DAPP');
	});

	it('has 18 decimals', async function () {
		expect(await this.token.decimals()).to.be.bignumber.equal('18');
	});

	it('assigns the total supply of tokens to the deployer', async function () {
		const [deployer] = await web3.eth.getAccounts();
		expect(await this.token.totalSupply()).to.be.bignumber.equal('1000000000000000000000000');
		expect(await this.token.balanceOf(deployer)).to.be.bignumber.equal('1000000000000000000000000');
	});

	it('transfers token balances', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '100000000000000000000';
		await this.token.transfer(recipient, amount, { from: deployer });
		expect(await this.token.balanceOf(deployer)).to.be.bignumber.equal('900000000000000000000000');
		expect(await this.token.balanceOf(recipient)).to.be.bignumber.equal(amount);
	});

	it('approves tokens for delegated transfer', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '100000000000000000000';
		await this.token.approve(recipient, amount, { from: deployer });
		expect(await this.token.allowance(deployer, recipient)).to.be.bignumber.equal(amount);
	});

	it('handles delegated token transfers', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '100000000000000000000';
		await this.token.approve(recipient, amount, { from: deployer });
		await this.token.transferFrom(deployer, recipient, amount, { from: recipient });
		expect(await this.token.balanceOf(deployer)).to.be.bignumber.equal('900000000000000000000000');
		expect(await this.token.balanceOf(recipient)).to.be.bignumber.equal(amount);
		expect(await this.token.allowance(deployer, recipient)).to.be.bignumber.equal('0');
	});

	it('emits a Transfer event', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '100000000000000000000';
		const { logs } = await this.token.transfer(recipient, amount, { from: deployer });
		expect(logs.length).to.equal(1);
		expect(logs[0].event).to.equal('Transfer');
		expect(logs[0].args.from).to.equal(deployer);
		expect(logs[0].args.to).to.equal(recipient);
		expect(logs[0].args.value).to.be.bignumber.equal(amount);
	});

	it('emits an Approval event', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '100000000000000000000';
		const { logs } = await this.token.approve(recipient, amount, { from: deployer });
		expect(logs.length).to.equal(1);
		expect(logs[0].event).to.equal('Approval');
		expect(logs[0].args.owner).to.equal(deployer);
		expect(logs[0].args.spender).to.equal(recipient);
		expect(logs[0].args.value).to.be.bignumber.equal(amount);
	});

	it('reverts when trying to transfer more than balance', async function () {
		const [deployer, recipient] = await web3.eth.getAccounts();
		const amount = '1000000000000000000000001';
		await expectRevert(this.token.transfer(recipient, amount, { from: deployer }), 'ERC20: transfer amount exceeds balance');
	});
});
