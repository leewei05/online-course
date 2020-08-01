class API < Grape::API
    version 'v1', using: :path, vendor: 'onlinecourse'
    format :json
    prefix :api
    
    desc 'Return users information'
    get :url do
        return 'test'
    end
end
