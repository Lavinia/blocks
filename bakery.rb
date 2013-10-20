class Bakery
  def make_me_a_bun_please
    Bun.new(secret_ingredient)
  end

  private

  def secret_ingredient
    'cardamom'
  end
end

class Bun
  def initialize(flavour)
    @flavour = flavour
  end
end

# 1
bakery.make_me_a_bun_please('cinnamon')

# 2
class Bakery
  def may_i_have_the_secret_recipe
    proc { Bun.new(secret_ingredient) }
  end
end

recipe = bakey.may_i_have_the_secret_recipe
1000.times do
  recipe.call
end
