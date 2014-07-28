require 'spec_helper'
module Api
  describe BoatsController do

    describe 'GET #index' do
      it 'returns succesfully' do
        get :index
        response.status.should eq 200
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        let(:params) { { boat: { name: "Amazon Express", capacity: 4 } } }

        it 'creates a new timeslot' do
          expect { post :create, params }.to change(Boat, :count).by 1
        end
      end

      context 'with missing params' do
        let(:params) { { boat: { name: "Amazon Express" } } }

        it 'responds with an error' do
          post :create, params
          response.status.should eq 400
        end
      end

      context 'with invalid params' do
        let(:params) { { boat: { name: 4, capacity: "Five" } } }

        it 'responds with an error' do
          post :create, params
          response.status.should eq 400
        end
      end
    end
  end
end
