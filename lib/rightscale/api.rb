module RightScale
  class API
    attr_reader :client
    
    def initialize(client, options = {})
      @client = client
      @resource = options[:resource] || self.class.name.split('::').last.downcase
      @singular = @resource.chop
      @format = 'xml'
    end
    
    def index
      response = client.get("/#{@resource}.#{@format}")
      return response["#{@resource}"]
    end
    
    def show(identifier)
      puts formatted_uri(identifier)
      response = client.get formatted_uri(identifier)
      return response["#{@singular}"]
    end
    
    def create
      # implement in derivative classes
    end
    
    def update
      # implement in derivative classes
    end
    
    def destroy(identifier)
      response = client.delete("/#{@resource}/#{identifier}")
    end
    
    # As discussed in more detail in the RightScale API Overview Guide, every
    # major resource exported by the RightScale API will always have an href
    # field that corresponds to the URL of the resource listed. 
    
    def formatted_uri(identifier)
      if identifier.is_a?(String)
        identifier.gsub(client.class.base_uri, '')
      else
        "/#{@resource}/#{identifier}.#{@format}"
      end
    end
    
  end
end