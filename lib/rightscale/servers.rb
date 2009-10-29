module RightScale 
  # http://support.rightscale.com/15-References/RightScale_API_Reference_Guide/02-Management/02-Servers
  class Servers < API
    def start(identifier)
      response = client.post("/servers/#{identifier}/start")
    end
    
    def stop(identifier)
      response = client.post("/servers/#{identifier}/stop")
    end
    
    def reboot(identifier)
      response = client.post("/servers/#{identifier}/reboot")
    end
    
    def run_script(identifier, right_script_href, params = {})
      query = {:server => {:right_script_href => right_script_href}}
      query[:server].merge(params) if !params.empty?

      response = client.post("/servers/#{identifier}/run_script", :query => query)
    end
    
    def attach_volume(ec2_ebs_volume_href, device)
      response = client.post("/servers/#{identifier}/attach_volume", :query => {
        :server => {
          :ec2_ebs_volume_href => ec2_ebs_volume_href,
          :device => device
        }
      })
    end
    
    def settings(identifier)
      response = client.get("#{formatted_uri(identifier)}/settings")
      return response['settings']
    end
  end
end