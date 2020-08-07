require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe OnlineCourse::Histories do
  resource :history do
      get '/api/v1/history/1' do
        example do
          do_request()
  
          expect(status).to eq 200
        end
      end
    end
end
