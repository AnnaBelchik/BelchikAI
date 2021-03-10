require 'rails_helper'

RSpec.describe ClientsController do
  let(:client) { create(:client) }

  describe 'show#GET' do
    subject { get :show, params: { id: client.id } }

    it 'should return client', :aggregate_failures do
      subject
      expect(assigns[:client]).not_to be_nil
      expect(assigns[:client][:id]).to be_eql(client.id)
    end

    it 'should return positive http status' do
      subject
      expect(response.status).to be_eql(200)
    end
  end

  describe 'sign_in#GET' do
    subject { get :sign_in }

    it 'should return client', :aggregate_failures do
      subject
      expect(assigns[:client]).not_to be_nil
    end

    it 'should return positive http status' do
      subject
      expect(response.status).to be_eql(200)
    end
  end

  describe 'check_sign_in#POST' do
    subject { post :check_sign_in, params: { client: { phone: client.phone, password: client.password } } }

    it 'should return 302 http status' do
      subject
      expect(response.status).to be_eql(302)
    end

    it 'should return client', :aggregate_failures do
      subject
      expect(assigns[:client]).not_to be_nil
      expect(assigns[:client][:id]).to be_eql(client.id)
    end

    describe 'bad_params' do
      subject { post :check_sign_in, params: { client: { phone: client.phone, password: nil } } }

      it 'should return error' do
        subject
        expect(flash[:error]).to be_eql('Bad phone or password')
      end
    end
  end

  describe 'new#GET' do
    subject { get :new }

    it 'should return new client', :aggregate_failures do
      subject
      expect(assigns(:client)[:id]).to be_nil
    end

    it 'should return positive http status' do
      subject
      expect(response.status).to be_eql(200)
    end
  end

  describe "create#POST" do
    let(:client_params) { attributes_for(:client) }
    subject { post :create, params: { client: client_params } }

    it 'should change clients count' do
      expect { subject }.to change { Client.count }.by(1)
    end

    it 'should return 302 http status' do
      subject
      expect(response.status).to be_eql(302)
    end

    it 'should return client', :aggregate_failures do
      subject
      expect(assigns[:client]).not_to be_nil
    end

    it 'should redirect to client path' do
      expect(subject).to redirect_to(assigns(:client))
    end

    describe 'bad params' do
      subject { post :create, params: { client: {surname: ''} } }

      it 'should return 422 status' do
        subject
        expect(response.status).to be_eql(422)
      end
    end
  end

  describe 'update#PUT' do
    let(:client_params) { attributes_for(:client) }
    subject { put :update, params: { id: client.id, client: client_params } }

    it 'should return 302 http status' do
      subject
      expect(response.status).to be_eql(302)
    end

    it 'should return client', :aggregate_failures do
      subject
      expect(assigns[:client]).not_to be_nil
    end

    it 'should update client', :aggregate_failures do
      subject
      client.reload
      expect(client.surname).to be_eql(client_params[:surname])
      expect(client.forename).to be_eql(client_params[:forename])
      expect(client.middle_name).to be_eql(client_params[:middle_name])
      expect(client.street).to be_eql(client_params[:street])
      expect(client.number_home).to be_eql(client_params[:number_home])
      expect(client.number_appartment).to be_eql(client_params[:number_appartment])
      expect(client.phone).to be_eql(client_params[:phone])
      expect(client.password).to be_eql(client_params[:password])
    end

    describe 'bad params' do
      subject { put :update, params: { id: client.id, client: { phone: 1} } }

      it 'should return 422 status' do
        subject
        expect(response.status).to be_eql(422)
      end
    end
  end

  describe 'sign_out#POST' do
    subject { post :sign_out, params: { id: client.id } }

    it 'should return 302 http status' do
      subject
      expect(response.status).to be_eql(302)
    end
  end
end
