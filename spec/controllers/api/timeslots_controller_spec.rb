require 'spec_helper'
module Api
  describe TimeslotsController do

    describe 'GET #index' do
      it 'returns succesfully' do
        get :index
        response.status.should eq 200
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        let(:params) { { timeslot: { start_time: 1406052000, duration: 120 } } }

        it 'creates a new timeslot' do
          expect { post :create, params }.to change(Timeslot, :count).by 1
        end
      end

      context 'with missing params' do
        let(:params) { { timeslot: { start_time: 1406052000 } } }

        it 'responds with an error' do
          post :create, params
          response.status.should eq 400
        end
      end

      context 'with invalid params' do
        let(:params) { { timeslot: { start_time: "4pm", duration: -10 } } }

        it 'responds with an error' do
          post :create, params
          response.status.should eq 400
        end
      end
    end
  end
end
