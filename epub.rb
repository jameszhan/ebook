# gem install rubyzip

require 'zip'
require 'nokogiri'
require(File.expand_path('dublin_core', File.dirname(__FILE__)))

class EPub
	DEFAULT_NS = 'urn:oasis:names:tc:opendocument:xmlns:container'
	attr_accessor :mime_type, :media_type, :dc

	def self.load(path)
			meta = EPub.new
			Zip::File.open(path) do |zip_file|
	      	# Handle entries one by one
	      	zip_file.each do |entry|
	        	#puts "Extracting #{entry.name}"
	        	case entry.name
							when 'mimetype'
								entry.get_input_stream do|io|
									meta.mime_type = io.read
								end
							when 'META-INF/container.xml'
								entry.get_input_stream do|io|
									doc = Nokogiri.XML(io)
									node = doc.at_xpath('//ns:rootfile', ns: DEFAULT_NS)
									meta.media_type = node.attribute('media-type')
									meta_file =  node.attribute('full-path')

									puts "meta_file: #{meta_file}"
									zip_file.get_input_stream(meta_file) do|meta_io|
										meta.dc = DublinCore.load_from_epub(Nokogiri.XML(meta_io))
									end
								end
							else
								if entry.name == 'toc.ncx'
									#puts entry.get_input_stream.read
								end
	        	end
	      	end
			end
			meta
	end
	
end