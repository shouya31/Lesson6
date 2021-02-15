class Player
  attr_reader :skills

  def initialize(args)
    @player_parameter = PlayerParameter.new(args)
    @skills = args[:skills] || nil
  end

  def attack
    puts '物理攻撃！相手に10HPのダメージ！！'
  end

  def defense
    puts '身を守る！10HPのダメージを軽減する！！'
  end

  def run_skills
    puts '使用する魔法を記入してください'
    skills.show_skills.each_with_index do |skill, i|
      puts "#{i}：#{skill.name}"
    end
    input = gets.to_i
    skill = skills.show_skills[input]
    skill.run_skill
  end
end

class PlayerParameter
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = args[:name] || nil
    @gender = args[:gender] || nil
    @vitality = args[:vitality] || nil
  end
end

class Skills
  attr_reader :fire_magic, :lighting_magic, :heal_magic, :dark_magic, :ice_magic

  def initialize(args)
    @fire_magic = args[:fire_magic] || nil
    @dark_magic = args[:dark_magic] || nil
    @lighting_magic = args[:lighting_magic] || nil
    @ice_magic = args[:ice_magic] || nil
    @heal_magic = args[:heal_magic] || nil
  end

  def run_skill
    raise 'Called abstract method: run_skill'
  end

  def show_skills
    skills = []
    skills << fire_magic unless fire_magic.nil?
    skills << lighting_magic unless lighting_magic.nil?
    skills << heal_magic unless heal_magic.nil?
    skills << ice_magic unless ice_magic.nil?
    skills << dark_magic unless dark_magic.nil?
    skills
  end
end

class FireMagic
  attr_reader :name

  def initialize
    @name = 'フレーム'
  end

  def run_skill
    puts "#{name}発動！敵に40HPのダメージ!!"
  end
end

class DarkMagic
  attr_reader :name

  def initialize
    @name = 'デス'
  end

  def run_skill
    puts "#{name}発動！自分のHPを１にして、相手のHPを０にしました!!"
  end
end

class LightingMagic
  attr_reader :name

  def initialize
    @name = 'イカズチ'
  end

  def run_skill
    puts "#{name}発動！敵に20HPのダメージ!!"
  end
end

class IceMagic
  attr_reader :name

  def initialize
    @name = 'アイス'
  end

  def run_skill
    puts "#{name}発動！敵に20HPのダメージ!!"
  end
end

class HealMagic
  attr_reader :name

  def initialize
    @name = 'ヒール'
  end

  def run_skill
    puts "#{name}発動！20HP回復!!"
  end
end

skills = Skills.new(heal_magic: HealMagic.new, lighting_magic: LightingMagic.new)

player = Player.new({ name: 'tanaka', gender: 'women', vitality: 100, skills: skills })

player.run_skills

