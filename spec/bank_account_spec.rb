require './bank_account'
describe BankAccount do
  it "creates a bank account" do
    account = BankAccount.new(50, "Rogerio")
    expect(account).to be_a(BankAccount)
  end

  it "creates an account with an opening balance" do
    account = BankAccount.new(50, "Rogerio")
    expect(account.balance).to eq(50)
  end

  it "creates an account with an name" do
    account = BankAccount.new(50, "Rogerio")
    expect(account.name).to eq("Rogerio")
  end

  it "should be able to accept deposits" do
    account = BankAccount.new(50, "Rogerio")
    account.deposit(100)
    expect(account.balance).to eq(150)
  end

  it "should be able to make withdrawals" do
    account = BankAccount.new(50, "Rogerio")
    account.withdraw(50)
    expect(account.balance).to eq(0)
  end

  it "should be able to transfer money between accounts" do
    jon = BankAccount.new(100, "Jon")
    rogerio = BankAccount.new(200, "Rogerio")
    BankAccount.transfer(rogerio, jon, 50)
    expect(jon.balance).to eq(150)
    expect(rogerio.balance).to eq(150)
  end

  it "throws an erro if the minimum opening balance of 20 is not met" do
    expect{ BankAccount.new(1, "Jon")}.to raise_error(ArgumentError)
  end

  it "allows user to configure the minimum balance" do
    BankAccount.minimum = 30
    expect{ BankAccount.new(25, "Jon")}.to raise_error(ArgumentError)
  end

end
