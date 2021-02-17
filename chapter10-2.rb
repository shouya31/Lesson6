class CPU
  def initialize(args)
    player_parameters = PlayerParameters.new(args)
    @player_basic_action = PlayerBasicAction.new
    get_occupy(args)
  end

  def attack
    player_basic_action.attack
  end

  def defense
    player_basic_action.defense
  end

  def get_occupy
    nil
  end
end

class PlayerBasicAction
  def attack
    puts '物理攻撃！相手に10HPのダメージ！！'
  end

  def defense
    puts '身を守る！10HPのダメージを軽減する！！'
  end
end

class PlayerParameter
  attr_reader :player_parameter

  def initialize(player_parameter)
    @player_parameter = player_parameter || nil
  end
end

class PlayerParameters
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = PlayerParameter.new(args[:name])
    @gender = PlayerParameter.new(args[:gender])
    @vitality = PlayerParameter.new(args[:vitality])
  end
end

class Player < CPU
  attr_reader :occupy

  def get_occupy(args)
    @occupy = args[:occupy]
  end

  def run_skill
    occupy.run_skill
  end
end

class AttackMagic
  attr_reader :name

  def initialize
    @name = "攻撃呪文"
  end

  def run_skill
    puts 'こうげきじゅもんをとなえた！ 相手に20HPダメージ。'
  end
end

class HealMagic
  attr_reader :name

  def initialize
    @name = "回復呪文"
  end

  def run_skill
    puts '回復呪文を発動しました。30HP回復します。'
  end
end

class Wizard
  attr_reader :skill

  def initialize
    @skill = AttackMagic.new
  end

  def run_skill
    skill.run_skill
  end
end

class Cleric
  attr_reader :skill

  def initialize
    @skill = HealMagic.new
  end

  def run_skill
    skill.run_skill
  end
end

class Sage
  attr_reader :skills

  def initialize
    @skills = [AttackMagic.new, HealMagic.new]
  end

  def run_skill
    puts "どちらのスキルを発動しますか？"
    skills.each_with_index do |skill, index|
      puts "#{index}：#{skill.name}"
    end
    input = gets.to_i
    skills[input].run_skill
  end
end

wizard = Wizard.new
cleric = Cleric.new
sage = Sage.new

player1 = Player.new({ name: 'tanaka', gender: 'woman', vitality: 100, occupy: wizard })
player2 = Player.new({ name: 'higuchi', gender: 'man', vitality: 120, occupy: cleric })
player3 = Player.new({ name: 'suzuki', gender: 'woman', vitality: 10, occupy: sage })

player1.run_skill
player2.run_skill
player3.run_skill
