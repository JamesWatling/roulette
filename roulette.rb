require 'rubygems'
require 'active_support/all'
require 'colorize'

# Get the require field from the user
puts "Enter the inital bet (Default is 0.01)".red
inital_bet = gets.chomp
puts "Enter the max bet (Default is 100)".green
max_bet = gets.chomp
puts "Enter the fee (Default is 2%)".blue
fee = gets.chomp
puts "Enter the win chance (Default is 49%)".blue
win_chance = gets.chomp
puts "Enter the number of bets to make (Default is 1000)".light_blue
num_bets = gets.chomp

# Set defaults if the user does not provide a value
if inital_bet.blank? then inital_bet = 0.01 end
if max_bet.blank? then max_bet = 100 end
if fee.blank? then fee = 2 end
if win_chance.blank? then win_chance = 49 end
if num_bets.blank? then num_bets = 1000 end
bank_balance = 1000
total_bets = 0

puts "\n" * 5

while bank_balance >= 0 and total_bets <= num_bets.to_i
  for single_bet in (1..Float::INFINITY)
    total_bets += 1
    bet = inital_bet.to_f * 2 ** (single_bet -1)
    could_win = bet * 2
    fee = 1- (fee / 100)
    post_fee = bet * fee

    #puts total_bets
    roll = rand() * 100
    if roll<= win_chance
      puts
      puts "WIN".green
      puts "************" * 5
      puts "Bet ##{single_bet}: Betting #{bet}"
      puts "Bank balance: #{bank_balance}"
      puts "Stand to win $#{bet * 2} less fee $#{fee}%"
      puts "After fee: $#{bet * ( 2 * ( 1 - fee.to_f / 100 ))}"
      puts "************" * 5
      bank_balance += post_fee
      puts "Bank balance: #{bank_balance}"
      puts "************" * 5
      puts
      break;
    else
      puts
      puts "LOSE".red
      puts "************" * 5
      puts "Bet ##{single_bet}: Betting #{bet}"
      puts "Bank balance: #{bank_balance}"
      puts "Stand to win $#{bet * 2} less fee $#{fee}%"
      puts "After fee: $#{bet * ( 2 * ( 1 - fee.to_f / 100 ))}"
      puts "************" * 5
      bank_balance -= post_fee
      puts "Bank balance: #{bank_balance}"
      puts "************" * 5
      puts
    end

  end
end


#puts "#{inital_bet.to_f} #{max_bet.to_f} #{fee.to_f} #{num_bets.to_f}"



