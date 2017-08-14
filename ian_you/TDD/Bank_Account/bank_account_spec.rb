require_relative 'bank_account'

RSpec.describe BankAccount do
    before(:each) do
        @bankaccount1 = BankAccount.new
    end

    it 'has getter method for retrieving the checking account balance' do
        @bankaccount1.deposit('checking', 5000)
        expect(@bankaccount1.checking).to eq(5000)
    end

    it 'has a getter method that retrieves the total account balance' do
        @bankaccount1.deposit('checking', 5000)
        @bankaccount1.deposit('saving',10000)
        expect(@bankaccount1.total).to eq(15000)
    end

    it 'has a function that allows the user to withdraw cash' do
        @bankaccount1.deposit('checking', 5000)
        @bankaccount1.deposit('saving',10000)
        @bankaccount1.withdrawl('checking', 1000)
        @bankaccount1.withdrawl('saving', 1000)
        
        expect(@bankaccount1.checking).to eq(4000)
        expect(@bankaccount1.saving).to eq(9000)

    end

    it 'cannot withdraw more money than it has in bankaccount' do
        expect{ @bankaccount1.withdrawl('checking', 10000) }.to raise_error("Insufficient fund in checking")
        expect { @bankaccount1.withdrawl('saving', 10000) }.to raise_error("Insufficient fund in saving")
    end

    it 'raises an error when the user attempts to retreive the total number of bank' do
        expect { @bankaccount.number_of_accounts }.to raise_error(NoMethodError)
    end

    it 'raises an error when the user attempts to set the interest rate' do
        expect { @bankaccount1.rate = 1 }.to raise_error(NoMethodError)
    end

end


# - Raises an error when the user attempts to retrieve the total number of bank accounts

# - Raises an error when the user attempts to set the interest rate