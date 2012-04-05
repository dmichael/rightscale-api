module RightScale
  class Client
    include HTTParty
    
    def initialize(account, email, password)
      @account, @email, @password = account, email, password
      self.class.base_uri "https://my.rightscale.com/api/acct/#{@account}"
    end

    def get(path, options={})
      request :get, path, options
    end
    
    def post(path, options={})
      request :post, path, options
    end
    
    def request(method, path, options={})
      options.merge!({
        :basic_auth => {:username => @email, :password => @password},
        :headers    => {'X-API-VERSION' => '1.0'}
      })

      response = self.class.send(method, "#{path}", options)
      # puts response.inspect
      return response
    end
  
    def deployments  
      @deployments ||= Deployments.new(self)
    end
    
    def servers
      @servers ||= Servers.new(self)
    end

    def server_arrays
      @server_arrays ||= ServerArrays.new(self, :resource => 'server_arrays')
    end
    
    def statuses
      @statuses ||= Statuses.new(self)
    end
    
    def right_scripts
      @right_scripts ||= RightScripts.new(self, :resource => 'right_scripts')
    end
  end  
end
