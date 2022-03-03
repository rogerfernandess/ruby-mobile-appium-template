# frozen_string_literal: true
class OrganizadorHomePage
  
  def initialize
    get_screen_mappings 'organizadorhome', 'login'
  end  

  def is_page?
    wait_for_element_exist(@mappings['perfil'])
    wait_for_element_exist(@mappings['logo'])
    screenshot('Home APP')
  end

end


