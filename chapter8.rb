class CPU
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = args[:name]
    @gender = args[:gender]
    @vitality = args[:vitality]
  end

  def attack
    puts '物理攻撃！相手に10HPのダメージ！！'
  end

  def defense
    puts '身を守る！10HPのダメージを軽減する！！'
  end
end

class Wizard < CPU
  def run_attck_magic
    puts 'こうげきじゅもんをとなえた！ 相手に20HPダメージ。'
  end
end

class Cleric < CPU
  def run_heal_magic
    puts '回復呪文を発動しました。30HP回復します。'
  end
end

class Sage < CPU
  def run_attck_magic
    puts 'こうげきじゅもんをとなえた！ 相手に20HPダメージ。'
  end

  def run_heal_magic
    puts '回復呪文を発動しました。30HP回復します。'
  end
end

wizard = Wizard.new({ name: 'tanaka', gender: 'woman', vitality: 100 })
cleric = Cleric.new({ name: 'higuchi', gender: 'man', vitality: 120 })
sage = Sage.new({ name: 'suzuki', gender: 'woman', vitality: 10 })

wizard.run_attck_magic
cleric.run_heal_magic

sage.run_attck_magic
sage.run_heal_magic