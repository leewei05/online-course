require 'rails_helper'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
    config.post_body_formatter = :json
end
