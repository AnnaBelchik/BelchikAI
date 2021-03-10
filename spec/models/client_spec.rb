require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { create(:client) }

  describe '#options_for_select' do
    subject { Client.options_for_select }

    it 'should return empty array' do
      expect(subject).to be_eql([])
    end

    it 'should return nested client array' do
      client
      expect(subject).to match_array([["#{client.surname} #{client.forename}", client.id]])
    end
  end

  describe '#check_sign_in' do
    it 'should return true' do
      expect(client.check_sign_in(client.password)).to be_eql(true)
    end

    it 'should return false' do
      expect(client.check_sign_in(nil)).to be_eql(false)
    end
  end

  describe '#full_name' do
    it 'should return full name' do
      expect(client.full_name).to be_eql("#{client.surname} #{client.forename} #{client.middle_name}")
    end
  end
end
