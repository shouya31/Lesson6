class CPU
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = args[:name] || nil
    @gender = args[:gender] || nil
    @vitality = args[:vitality] || nil
    get_skills(args)
  end

  def attack
    puts '物理攻撃！相手に10HPのダメージ！！'
  end

  def defense
    puts '身を守る！10HPのダメージを軽減する！！'
  end

  def get_skills
    nil
  end
end

class Player < CPU
  attr_reader :skills

  def get_skills(args)
    @skills = args[:skills] || nil
  end

  def run_skills
    puts '使用する魔法を数字で記入してください'
    skills.each_with_index do |skill, i|
      puts "#{i + 1}：#{skill.name}"
    end
    input = gets.to_i
    skill = skills[input - 1]
    skill.run_skill
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

skill_set1 = [ heal_magic, fire_magic, ice_magic ]
skill_set2 = [ lighting_magic, dark_magic ]

player1 = Player.new({ name: 'tanaka', gender: 'woman', vitality: 100, skills: skill_set1 })
player2 = Player.new({ name: 'higuchi', gender: 'man', vitality: 120, skills: skill_set2 })

puts '【player1】の攻撃'
player1.run_skills

puts '-------------------------'

puts '【player2】の攻撃'
player2.run_skills
