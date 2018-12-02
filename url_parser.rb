

class UrlParser 
    attr_accessor :insecure_url

    def initialize(new_url)
    @new_url = new_url
    end
    def scheme
        @scheme = @new_url.split("://")[0]
    end
    def domain
        @domain = @new_url.split(/(:\/\/|:)/)[2]
    end
    def port
        @port = @new_url.split(/(:\/\/|:|\/)/)[4]
        # if @port = @new_url.split(/(:\/\/|:|\/)/)[4] 
        #     return @port
        # else    
        # #  @port = @insecure_url.gsub("/search",":80/search")
        #     @port = @insecure_url.split(/(\/)/)[5].gsub("/","80")
        # # @port = @new_url.split(/(:\/\/|:|\/)/)[4]
        # end
    end
    def path
        @path = @new_url.split('//')[1].split('/')[1].split("?")[0]
        @path == "" ? NIL : @path
    end
    def query_string
        @query_string = @new_url.split(/(\?|#)/)[2].gsub(/(=|&)/, ' ').split
        Hash[*@query_string]
    end
    def fragment_id
       @fragment_id =  @new_url.gsub("/search",":80/search").split("/")[3].split("#")[1]
    end
end




