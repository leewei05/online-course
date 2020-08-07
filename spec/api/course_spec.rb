require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.describe OnlineCourse::Courses do
  resource :course do
      get '/api/v1/course/all' do
        example do
          do_request()
  
          expect(status).to eq 200
        end
      end
    end
end
