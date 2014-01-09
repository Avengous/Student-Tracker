module TransactionsHelper
  def available_laptops
    Laptop.where(available: true)
  end
end
