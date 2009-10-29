RightScale API
===================

This is a light Ruby wrapper around the RightScale API.
It, like the RightScale API itself is a little incomplete. It should however be ready soon for general use as it is being developed for a production application. 
Below is an example of usage. Please contact if with bug reports or if you would like to contribute.

At the moment only GET requests are implemented.

    account  = 1234
    username = 'alibaba@example.com'
    password = 'opensezme'
     
    rightscale  = RightScale::Client.new(account, username, password)
    
    deployments = rightscale.deployments
    servers     = rightscale.servers
    right_scripts = rightscale.right_scripts


    production = deployments.index.find {|d| d['nickname'] == 
      'Production Deployment V1' 
    }

    production['servers'].each {|server|
      settings = servers.settings(server['href'])
      dns      = settings['dns_name']
      pp IPSocket.getaddress(dns) if dns
    }

    pp rightscale.right_scripts.show(1234)
    pp rightscale.deployments.show(1234)
    pp rightscale.servers.show(1234)