class CPU
  attr_reader :player_status, :occupy, :player_basic_action

  def initialize(args)
    @player_status = PlayerStatus.new
    @player_basic_action = PlayerBasicAction.new
    @occupy = args[:occupy]
  end

  def attack
    player_basic_action.attack
  end

  def defense
    player_basic_action.defense
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


class AttackMagic
  def run_skill
    puts "こうげきじゅもんをとなえた！ 相手に20HPダメージ。"
  end
end

class HealMagic
  def run_skill
    puts "回復呪文を発動しました。30HP回復します。"
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
  attr_reader :attack_skill, :heal_skill

  def initialize
    attack_skill = AttackMagic.new
    heal_skill = HealMagic.new
  end

  def run_attack_skill
    attack_skill.run_skill
  end

  def run_heal_skill
    heal_skill.run_skill
  end
end