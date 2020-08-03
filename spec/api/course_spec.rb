require 'rails_helper'

RSpec.describe OnlineCourse::Courses do
    context 'Get all courses information'
    it 'courses' do
      get '/api/v1/course/all'
      expect(response.status).to eq(200)
    end
  end