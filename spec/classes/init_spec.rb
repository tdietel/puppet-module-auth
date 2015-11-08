require 'spec_helper'
describe 'auth' do

  context 'with defaults for all parameters' do
    it { should contain_class('auth') }
  end
end
