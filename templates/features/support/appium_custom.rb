# frozen_string_literal: true

  def wait_for_element_exist(el)
    $wait.until { element_exists?(el) }
    $logger.info("Aguardou a existência do elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
  end

  def element_exists?(el)
    $logger.info("Verificando se existe o elemento #{el['value']} usando o tipo de busca #{el['tipo_busca']}")
    $driver.find_elements(el['tipo_busca'], el['value']).count > 0
  end

  def find(el)
    $driver.find_element(el['tipo_busca'], el['value'])
  end

  def hide_keyboard
    if android?
      $driver.hide_keyboard
    elsif ios?
      $driver.hide_keyboard :pressKey
    end
    $logger.info('Fechou o teclado virtual')
  end

  def send_keys_digital_keyboard el, text
    text.to_s.strip.each_char do |c|
    case $platform
      when 'android'    
        $driver.execute_script("mobile: shell", {"command": "input text '#{c}'"})
      when 'ios'
        find(el).send_keys c
      end
    end
  end

  def send_keys el,text
    $driver.find_element(el['tipo_busca'], el['value']).send_keys(text)
  end

  #metodo para swipe criado como paleativo até que seja ajustado o elemento unico de tela
  def swipe_orientation(el_from, el_to, orientation, max_swipes = 5)
    screen = $driver.window_size
    pos_el_from = find(el_from).location
    start_x = (screen.width / 5 * 4).abs
    end_x = (screen.width / 2).abs
    start_y = (screen.height / 5 * 4).abs
    end_y = (screen.height / 2).abs
    $driver.manage.timeouts.implicit_wait = 0
    swipes = 0
    while ((!element_exists?(el_to)) || (!find(el_to).displayed?)) && (swipes <= max_swipes)
      case orientation
        when "left"
          Appium::TouchAction.new.swipe(start_x: start_x, start_y: pos_el_from.y + 20, end_x: end_x, end_y: pos_el_from.y + 20, duration: 500).perform
        when "right"
          Appium::TouchAction.new.swipe(start_x: end_x, start_y: pos_el_from.y + 20, end_x: start_x, end_y: pos_el_from.y + 20, duration: 500).perform
        when 'up'
          Appium::TouchAction.new.swipe(start_x: pos_el_from.x + 20, start_y: start_y, end_x: pos_el_from.x + 20, end_y: end_y, duration: 500).perform
        when 'down'
          Appium::TouchAction.new.swipe(start_x: pos_el_from.x + 20, start_y: end_y, end_x: pos_el_from.x + 20, end_y: start_y, duration: 500).perform
      end
      swipes += 1
    end 
    $driver.manage.timeouts.implicit_wait = 30
  end