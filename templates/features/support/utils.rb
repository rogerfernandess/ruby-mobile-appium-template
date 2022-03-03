require 'fileutils'

def android?
  $platform == 'android'
end

def ios?
  $platform == 'ios'
end

def screenshot(step)
  screenshot = $driver.screenshot("allure-results/#{$platform}/ss.png")
  Allure.add_attachment(name: "#{@scenario_name} - #{step}", source: screenshot, type: Allure::ContentType::PNG)
  File.delete("allure-results/#{$platform}/ss.png")
end


#necessário para anexar direto o binário da screenshot no relatório
module Allure
  class FileWriter
    def write(name, source)
      filename = File.join(output_dir, name)
      File.open(filename, "wb") { |file| file.write(source) }
    end
  end
end

Allure.configure do |c|
  c.results_directory = './allure-results/'
  c.clean_results_directory  = false
end

def tempDirectories()
  time  = Time.new
  time = time.strftime('%d-%m-%Y')
  loggerPath = "#{Dir.pwd}/exec-logs"
  allure = "#{Dir.pwd}/allure-results"
  Dir.exists?(allure) ? cleanFolder("#{allure}/.") && Dir.mkdir("#{allure}/#{$platform}") : Dir.mkdir(allure) && Dir.mkdir("#{allure}/#{$platform}")
  Dir.exists?(loggerPath) ? cleanFolder("#{loggerPath}/.") : Dir.mkdir(loggerPath)
  $logger = Logger.new("#{loggerPath}/exec-log-#{time}.log")
end

def cleanFolder(folderPath)
  FileUtils.rm_rf(folderPath, secure: false)
end

#Metodo para iniciar os arquivos datas das Features
def init_data(package)
	dir = "#{Dir.pwd}/features/#{package}/data"
	data = {}
	Dir.foreach(dir) do |filename|
		next if filename == '.' or filename == '..'
		area = File.basename(filename, ".yaml").to_s
		data["#{area}"] = YAML.load_file("#{dir}/#{filename}")
	end
  return data
end

#Metodo para iniciar os arquivos de mapeamento dos elementos
def get_screen_mappings(screen, package)
  dir = "#{Dir.pwd}/features/#{package}/elements/screen_mappings_#{screen}.yaml"
  screen_mappings = YAML.load_file(dir)
  @mappings = screen_mappings[$platform]
end

#Metodo verifica se plataforma foi fornecida no inicio da execuçáo do teste
def verify_platform()
  raise 'Por favor defina a plataforma (android|ios)' if ENV['PLATFORM'].nil?
  if ENV['PLATFORM'].downcase == "android" || ENV['PLATFORM'].downcase == "ios"
    $platform = ENV['PLATFORM'].downcase
  else
    raise("Testes não suportados para esta plataforma #{ENV['PLATFORM'].downcase}")
  end
end

#Metodo verifica se foi informado que o teste rodará na farm ou localmente
def verify_where()
  raise 'Por favor defina onde será executado o teste (local|farm)' if ENV['WHERE'].nil?
  if ENV['WHERE'].downcase == "local" || ENV['WHERE'].downcase == "farm"
     $where = ENV['WHERE'].downcase
   else
    raise("Não é possivel executar os testes em #{ENV['WHERE'].downcase}")
  end
end
