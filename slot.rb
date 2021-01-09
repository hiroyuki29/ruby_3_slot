class Slot
  attr_reader :drum_numbers
  def initialize
    @drum_numbers = [["-","-","-"],
                    ["-","-","-"],
                    ["-","-","-"]]
    @comments = ["上列","中央列","下列","右下斜め", "右上斜め"]
  end
  
  def stop(stop_num, player)
    @drum_numbers[stop_num] = [rand(1..player.level), rand(1..player.level), rand(1..player.level)]
  end
  
  def show
    puts "#{@drum_numbers[0][0]} #{@drum_numbers[1][0]} #{@drum_numbers[2][0]}"
    puts "#{@drum_numbers[0][1]} #{@drum_numbers[1][1]} #{@drum_numbers[2][1]}"
    puts "#{@drum_numbers[0][2]} #{@drum_numbers[1][2]} #{@drum_numbers[2][2]}"
  end
    
  def slot_play(bit_num)
    win_point = 0
    total_win_point = 0
    for i in 0..bit_num-1 do
      check_numbers = [@drum_numbers[0][i],@drum_numbers[1][i],@drum_numbers[2][i]]
      check = check_numbers.uniq.size
      if check == 1 then
        win_point = check_numbers[0] * 10
        total_win_point += win_point
        puts "#{@comments[i]}に#{check_numbers[0]}が揃いました！#{win_point}ポイントGET!!"
      end
    end
    if bit_num == 3
      check_numbers = [@drum_numbers[0][0],@drum_numbers[1][1],@drum_numbers[2][2]]
      check = check_numbers.uniq.size
      if check == 1 then
        win_point = check_numbers[0] * 10
        total_win_point += win_point
        puts "#{@comments[3]}に#{check_numbers[0]}が揃いました！#{win_point}ポイントGET!!"
      end
      
      check_numbers = [@drum_numbers[0][2],@drum_numbers[1][1],@drum_numbers[2][0]]
      check = check_numbers.uniq.size
      if check == 1 then
        win_point = check_numbers[0] * 10
        total_win_point += win_point
        puts "#{@comments[4]}に#{check_numbers[0]}が揃いました！#{win_point}ポイントGET!!"
      end
    end
    
    if total_win_point != 0
      puts "合計で#{total_win_point}GET!!!!!!"
    end
    return total_win_point
  end
  
end



