require "ruby_odata"

class OData::Service
	def collections
    @collections
	end
end

def test_service(uri)
	svc = OData::Service.new uri
	data = {}
	svc.collections.each do |collection|
		print "Checking #{collection}... "
		if svc.respond_to? collection
			query = svc.__send__(collection).top(1)
			data[collection] = svc.execute.to_json
			puts "succeded!"
		end
	end
	data
end

ARGV.each do |uri|
	puts test_service(uri)
end