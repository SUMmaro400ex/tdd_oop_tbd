class BankAccount

  attr_accessor :balance, :name

  def self.transfer(account1, account2, amount)
    account1.withdraw(amount)
    account2.deposit(amount)
  end

  def self.minimum
    @@minimum ||= 20
  end

  def self.minimum=(amount)
    @@minimum = amount
  end

  def initialize(balance, name)
    raise ArgumentError if balance < minimum
    @balance = balance
    @name = name
  end

  def minimum
    self.class.minimum
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end
