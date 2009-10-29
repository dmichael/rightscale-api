module RightScale
  class Statuses
    attr_reader :client

    def initialize(client)
      @client = client
      @@resource = self.class.name.split('::').last.downcase
      @@format = 'xml'
    end
  
    def show(identifier)
      response = client.get("/#{@@resource}/#{identifier}.#{@@format}")
      return response["#{@@resource.chop}"]
    end
  end
end