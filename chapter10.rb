class Player
  attr_reader :player_status, :skills, :player_basic_action

  def initialize(args)
    @player_status = PlayerStatus.new
    @player_basic_action = PlayerBasicAction.new
    @skills = args[:skills]
  end

  def attack
    player_basic_action.attack
  end

  def defense
    player_basic_action.defense
  end

  def run_skills
    skills.run_skill(skills)
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
  attr_reader :name, :description, :value

  def initialize(args)
    @name = args[:name] || nil
    @description = args[:description] || nil
    @value = args[:value] || nil
  end
end

class PlayerStatus
  attr_reader :nickname, :gender, :vitality

  def initialize
    @nickname = PlayerParameter.new(name: "名前", description: "プレイヤーの名前です。", value: "ひぐち")
    @gender = PlayerParameter.new(name: "性別", description: "プレイヤーの性別です。", value: "女")
    @vitality = PlayerParameter.new(name: "HP", description: "プレイヤーがもつ体力ゲージです", value: 100)
  end
end


class Skill
  attr_reader :fire_magic, :lighting_magic, :heal_magic, :dark_magic, :ice_magic

  def initialize(args)
    @fire_magic = args[:fire_magic] || nil
    @dark_magic = args[:dark_magic] || nil
    @lighting_magic = args[:lighting_magic] || nil
    @ice_magic = args[:ice_magic] || nil
    @heal_magic = args[:heal_magic] || nil
  end

  def run_skill(skills)
    puts '使用する魔法を記入してください'
    skills.show_skills.each_with_index do |skill, i|
      puts "#{i}：#{skill.name}"
    end
    input = gets.to_i
    skill = skills.show_skills[input]
    skill.run_skill
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


skills = Skill.new(heal_magic: HealMagic.new, lighting_magic: LightingMagic.new)

player = Player.new({ skills: skills })

player.run_skills

