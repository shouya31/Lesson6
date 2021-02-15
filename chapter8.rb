class CPU
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = args[:name] || nil
    @gender = args[:gender] || nil
    @vitality = args[:vitality] || nil
    get_skills(args)
  end

  def get_skills
    nil
  end
end

class Player < CPU
  attr_reader :fire_magic, :lighting_magic, :heal_magic, :dark_magic, :ice_magic

  def get_skills(args)
    @fire_magic = args[:fire_magic] || nil
    @dark_magic = args[:dark_magic] || nil
    @lighting_magic = args[:lighting_magic] || nil
    @heal_magic = args[:heal_magic] || nil
    @ice_magic = args[:ice_magic] || nil
  end

  def attack
    puts '物理攻撃！相手に10HPのダメージ！！'
  end

  def defense
    puts '身を守る！10HPのダメージを軽減する！！'
  end

  def run_fire_skill
    if fire_magic
      fire_magic.run_skill
    else
      output_nothing_skill
    end
  end

  def run_heal_skill
    if heal_magic
      heal_magic.run_skill
    else
      output_nothing_skill
    end
  end

  def run_dark_skill
    if dark_magic
      dark_magic.run_skill
    else
      output_nothing_skill
    end
  end

  def run_ice_skill
    if ice_magic
      ice_magic.run_skill
    else
      output_nothing_skill
    end
  end

  def run_lighting_skill
    if lighting_magic
      lighting_magic.run_skill
    else
      output_nothing_skill
    end
  end

  def output_nothing_skill
    puts 'そのスキルは覚えていません!!'
  end
end

class Skill
  def run_skill
    raise 'Called abstract method: run_skill'
  end
end

class FireMagic < Skill
  attr_reader :name

  def initialize
    @name = 'フレーム'
  end

  def run_skill
    puts "#{name}発動！敵に40HPのダメージ!!"
  end
end

class DarkMagic < Skill
  attr_reader :name

  def initialize
    @name = 'デス'
  end

  def run_skill
    puts "#{name}発動！自分のHPを１にして、相手のHPを０にしました!!"
  end
end

class LightingMagic < Skill
  attr_reader :name

  def initialize
    @name = 'イカズチ'
  end

  def run_skill
    puts "#{name}発動！敵に20HPのダメージ!!"
  end
end

class IceMagic < Skill
  attr_reader :name

  def initialize
    @name = 'アイス'
  end

  def run_skill
    puts "#{name}発動！敵に20HPのダメージ!!"
  end
end

class HealMagic < Skill
  attr_reader :name

  def initialize
    @name = 'ヒール'
  end

  def run_skill
    puts "#{name}発動！20HP回復!!"
  end
end

heal_magic = HealMagic.new
fire_magic = FireMagic.new
dark_magic = DarkMagic.new
ice_magic = IceMagic.new
lighting_magic = LightingMagic.new

player1 = Player.new({ name: 'tanaka', gender: 'woman', vitality: 100, fire_magic: fire_magic, lighting_magic: lighting_magic })
player2 = Player.new({ name: 'higuchi', gender: 'man', vitality: 120, dark_magic: dark_magic })

puts '【player1】'
player1.run_fire_skill
player1.run_heal_skill
player1.run_dark_skill
player1.run_ice_skill
player1.run_lighting_skill
puts '-------------------------'

puts '【player2】'
player2.run_fire_skill
player2.run_heal_skill
player2.run_dark_skill
player2.run_ice_skill
player2.run_lighting_skill
puts '-------------------------'

