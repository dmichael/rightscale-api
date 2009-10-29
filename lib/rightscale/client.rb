module RightScale
  class Client
    include HTTParty
    
    def initialize(account, email, password)
      @account, @email, @password = account, email, password
      self.class.base_uri "https://my.rightscale.com/api/acct/#{@account}"
    end

    def get(path, options={})
      options.merge!({
        :basic_auth => {:username => @email, :password => @password},
        :headers    => {'X-API-VERSION' => '1.0'}
      })
      
      self.class.get("#{path}", options)
    end
  
    def deployments  
      @deployments ||= Deployments.new(self)
    end
    
    def servers
      @servers ||= Servers.new(self)
    end
    
    def statuses
      @statuses ||= Statuses.new(self)
    end
    
    def right_scripts
      @right_scripts ||= RightScripts.new(self, :resource => 'right_scripts')
    end
  end  
end
