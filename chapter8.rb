class CPU
  attr_reader :name, :gender, :vitality

  def initialize(args)
    @name = args[:name]
    @gender = args[:gender]
    @vitality = args[:vitality]
  end

  def attack
    puts "#{name}のこうげき！相手に10HPダメージ。"
  end

  def defense
    puts "#{name}はみをまもった！"
  end
end

class Wizard < CPU

  def run_attck_magic
    puts "こうげきじゅもんをとなえた！ 相手に20HPダメージ。"
  end
end

class Cleric < CPU

  def run_heal_magic
    puts "回復呪文を発動しました。30HP回復します。"
  end
end

class Sage < CPU

  def run_attck_magic
    puts "こうげきじゅもんをとなえた！ 相手に20HPダメージ。"
  end

  def run_heal_magic
    puts "回復呪文を発動しました。30HP回復します。"
  end
end