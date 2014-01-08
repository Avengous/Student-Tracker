module TransactionsHelper
  def available_laptops
    total_available = Array.new
    Laptop.all.each do |laptop|
      laptop.available? ? total_available << laptop : nil
    end
    return total_available
  end
end
