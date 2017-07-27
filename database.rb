require 'httparty'

class DBhelper
    attr_reader :url_base, :url_select, :url_delete, :url_update, :url_insert
    
    def initialize(base_url)
        @url_base = base_url
        @url_base = 'https://bargegeneric.stamplayapp.com/api/cobject/v1/dummy'
    end
        
    def select
        HTTParty.get base_url
    end
    def insert 
        payload = ""
        HTTParty.post(base_url, payload)
    end 
    
    def update
        HTTParty.put(base_url, )
    end
    
    def delete
        url_payload = base_url + querystring
        HTTParty.delete()
    end 
    
    
end 