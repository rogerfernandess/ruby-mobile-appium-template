# frozen_string_literal: true
class HomePage

  def initialize
    get_screen_mappings 'home', 'login'
  end
  
  def is_home?
    if $platform == 'android'
      wait_for_element_exist(@mappings['imagemHome'])
    end
    if $platform == 'ios'
      wait_for_element_exists(@mappings['imagemHome'])
      find(@mappings['telaWalkThrough']).click
    end
    wait_for_element_exist(@mappings['telaWalkThrough'])
  end

  def pulaWalkThrough
    swipe_orientation(@mappings['telaWalkThrough'], @mappings['btnWalkThrough'], "up")
    find(@mappings['btnWalkThrough']).click
  end
end

