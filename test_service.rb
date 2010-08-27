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
		puts "Checking #{collection}"
		if svc.respond_to? collection and collection != "Titles"
			query = svc.__send__ collection
			query.top(1)
			result = svc.execute
			data[collection] = svc.execute.to_json
		end
	end
	data
end

puts test_service "http://localhost/waam/api/v1.svc"