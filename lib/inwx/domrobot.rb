require "xmlrpc/client"

module INWX
  class Domrobot
    attr_accessor :client, :cookie

    def initialize(address, options = {})
      @options = options
      @cookie = ""
      # Create a new client instance
      @client = XMLRPC::Client.new(address,"/xmlrpc/","443", nil, nil, nil, nil, true, 100)
    end
    
    def login(username = false, password = false, language = 'en')
      params = { :user => username, :pass => password, 'lang' => language }
      ret = call("account","login",params)
      cookie = client.cookie
      unless cookie.nil? || cookie.length <= 2
        setCookie(cookie)
      end
      return ret
    end
    
    def logout()
      call("account","logout")
    end
    
    def setCookie(cookie)
      self.cookie = cookie
      unless @options[:skip_cookie_file]
        fp = File.new("domrobot.tmp", "w")
        fp.write(cookie)
        fp.close
      end
    end
    
    def getCookie()
      if self.cookie.length > 2
        return self.cookie
      end
      unless @options[:skip_cookie_file]
        if File.exist?("domrobot.tmp")
          fp = File.new("domrobot.tmp", "r")
          cookie = fp.read()
          fp.close
          return cookie
        end
      end
    end
    
    def call(object, method, params = {})
      client.cookie = getCookie()
      # Call the remote method
      client.call(object+"."+method, params)
    end
  end
end
