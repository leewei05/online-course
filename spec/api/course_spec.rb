require 'api_helper'

RSpec.describe OnlineCourse::Courses do
  resource :course do
  header "Content-Type", "application/json"
      get '/api/v1/courses' do
        example do
          do_request()
  
          expect(status).to eq 200
        end
      end
      
      post '/api/v1/courses/:id/purchases' do
        context '200' do
            let(:course) { create(:course) }
            let(:user_id) { 1 }
            let(:params) {
                { 
                    id: course.id,
                    user_id: 1
                }
            }

            Timecop.freeze
            example 'Purchase a course' do
                expected_response = {
                    id: 1,
                    user_id: 1,
                    course_id: 2,
                    purchase_at: Time.now.strftime("%Y-%m-%d"),
                    price: 99.99,
                    currency: "USD",
                    created_at: Time.now.utc,
                    updated_at: Time.now.utc
                }.to_json

                do_request(params)
                
                expect(response_body).to eq(expected_response)
                expect(status).to eq 201

                Timecop.return
                result = JSON.parse(response_body)
                expect(result["course_id"]).to eq course.id 
            end
        end
      end
    end
end
