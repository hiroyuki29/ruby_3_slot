require './slot.rb'
require './player.rb'


fight_flag = 1 #1だとプレイ中　０で終了

puts "
      スロットゲームへようこそ！
      まずは名前とレベルを入力してください
      レベルが高いほど難しくなります（ドラムの数字が１〜レベル数になります)
      bit数によって下記の通り判定する列が変わります
      　・１：上列
      　・２：上列と中央列
      　・３：上列と中央列と下列と斜め列
      　
      では頑張ってください！
      "

puts "名前は？"
name = gets.chomp
puts "レベルは？"
level = gets.chomp.to_i
  

player1 = Player.new(name, level)
 
while player1.coin > 0 and fight_flag == 1 do 
  slot1 = Slot.new
  puts "何ビットする？"
  puts "1bit(10枚) 2bit(20枚） 3bit(30枚)"
  bit = gets.chomp.to_i
  if bit > 3
    puts "そんなに賭けれません！3bitにしときます"
    bit = 3
  end
  if player1.coin < bit * 10
    bit = player1.coin / 10
    puts "コインが足りないよ・・・"
    puts "#{bit}bitまでしか賭けれないから、#{bit}bitにしますね"
  end

  player1.coin -= bit * 10
  
  puts "enterを３回おしてください"
  for i in 0..2 do
    gets
    slot1.stop(i, player1)
    slot1.show
  end
  
  player1.point += slot1.slot_play(bit)
  puts "現在のコイン:#{player1.coin}, 現在のポイント#{player1.point}"
  if player1.coin == 0
    break
  end
  puts "もうやめますか？ Y"
  answer = gets.chomp
  if answer == "Y" or answer == "y"
    fight_flag = 0
  end
end
puts "結果発表！"
puts "あなたのポイントは#{player1.point}でした！"
puts "#{player1.name}さん　お疲れ！"