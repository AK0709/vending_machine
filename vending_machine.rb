# irb
# require '/Users/hikaru/Documents/DIVE/workspace/pairpro/zihanki.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sales = 0
    @drink = [{name: 'cola', price: 120, stock: 5}]
  end

  def slot_money(money)
    return "扱えないお金です。#{money}円を返します" unless MONEY.include?(money)
    @slot_money += money
  end

  def current_slot_money
    puts "投入金額は#{@slot_money}です。"
    @drink.each do |y|
      puts "#{y[:name]}は購入可能です。" if @slot_money >= y[:price]
      puts "#{y[:name]}は購入できません。" if @slot_money <= y[:price]
    end
  end

  def buy_info
    @drink.each do |x|
      puts "#{x[:name]}を買うならvm.buy()に#{@drink.index(x)}を入力してください" if @slot_money >= x[:price]
    end
  end

  def buy(drink)
    if @slot_money >= @drink[drink][:price] && @drink[drink][:stock] >= 1
      @drink[drink][:stock] -= 1
      @sales += @drink[drink][:price]
      @slot_money = @slot_money -= @drink[drink][:price]
      puts "#{@drink[drink][:name]}を購入しました"
      puts "お釣りは#{@slot_money}円です"
    else
      puts "購入できません"
      # puts "番号を入力してください"
      # drink = gets.to_i1
      # buy(drink)
    end
  end

  def return_money
    puts "お釣りは#{@slot_money}です"
    @slot_money = 0
  end

  def drink_stock
    d = {name: '', price: '', stock: ''}
    puts "格納する飲み物について教えてください"
    puts "飲み物の名前はなんですか？"
    d[:name] = gets.chomp
    # if i[:name] == @drink[0...x][:name]
    puts "値段はいくらですか？"
    d[:price] = gets.to_i
    puts "何個格納しますか？"
    d[:stock] = gets.to_i
    @drink << d
    puts "#{d[:price]}円の#{d[:name]}を#{d[:stock]}個格納しました"
  end

  def stock_show
    @drink.each do |s|
      puts "#{s[:price]}円の#{s[:name]}が#{s[:stock]}個あります"
    end

  end

  def sales
    puts "現在の売り上げは#{@sales}円です"
  end
end

#
# vm = VendingMachine.new
# puts "管理者は１を、購入者は２を,終了は３を入力してください"
# i = gets.to_i
# while i != 3
# if i == 1
#     puts "売り上げ確認は１を、飲料格納は２を入力してください"
#     x = gets.to_i
#     vm.sales if x == 1
#     vm.drink_stock if x == 2
# else
#     puts "お金を投入してください"
#     money = gets.to_i
#     vm.slot_money(money)
#     vm.current_slot_money
#     vm.buy_info
#     drink = gets.to_i
#     vm.buy(drink)
#     vm.return_money
#     puts "ありがとうございました"
# end
#   break
# end
