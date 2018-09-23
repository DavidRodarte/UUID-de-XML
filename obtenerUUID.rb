#/usr/bin/env ruby
#Clase de archivos xml
class ArchivosXML
  #Función para iterar sobre todos los documentos xml en la carpeta
  def leerUUID
    #Obtener todos los archivos
    archivos = Dir.glob('./*.xml')
    #Iterar cada archivo
    archivos.each do |archivo|
      #Abrir cada archivo r para "read"
      File.open(archivo,"r").each do |xml|
        #scan al XML para guardar los valores solo de UUID
        uuid=xml.scan(/UUID=(.*)V/m).to_s
        #Se imprime solo el valor de UUID quitando otros elementos
        uuid = uuid[5..-7]
        puts uuid
        #Abrir y a para "append" la variable uuid
        File.open("UUID.txt", "a") { |archivoTexto| archivoTexto.puts uuid}
      end
    end
  end
end

  #Borrar el contenido del archivo de texto, w para reescribir
  File.open("UUID.txt", "w") { |archivo| archivo.print ""}
  puts "\n"
  uuid = ArchivosXML.new
  uuid.leerUUID
  puts "\n \n_______________ Presiona ENTER para salir _______________"
  i = gets.chomp i
