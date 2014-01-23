module LaptopsHelper
  def check_if_disabled(laptop)
    find_transactions = Transaction.where( laptop_id: laptop.id )
    if find_transactions.to_a.size == 0 && !laptop.available
      return 'Disabled'
    end
  end
end
