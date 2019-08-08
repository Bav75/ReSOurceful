module SearchesHelper

    def api_endpoint_builder(search_tags)
        api_endpoint = 'http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=votes&accepted=True&site=stackoverflow&tagged='
        search_tags.each do |tag|
            if tag == search_tags[search_tags.size - 1]
                api_endpoint += "#{tag}"
            else
                api_endpoint += "#{tag};"
            end
        end
        api_endpoint
    end

end