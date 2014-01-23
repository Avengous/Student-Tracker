module LaptopsHelper
  def check_if_disabled(laptop)
    find_transactions = Transaction.where( laptop_id: laptop.id )
    if find_transactions.to_a.size == 0 && !laptop.available
      return 'Disabled'
    end
  end
  
  def check_if_checked_out(laptop)
    transactions = Transaction.where( laptop_id: laptop.id)
    if transactions.to_a.size == 0
      return "No"
    else
      checked_out = 1
      transactions.each do |t|
        if t.time_in == nil
          checked_out = 'Yes'
        end
      end
      if checked_out == 1
        checked_out = 'No'
      end
      return checked_out
    end 
  end
end
