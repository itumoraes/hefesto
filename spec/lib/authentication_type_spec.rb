require 'rails_helper'
require 'authentication_type'

describe AuthenticationType do
  let(:klass) do
    Class.new do
      def self.devise(*modules)
        @modules = modules
      end

      def self.devise_modules
        @modules
      end

      include AuthenticationType
    end
  end

  describe '.included' do
    context 'when cas.yml file exists' do
      before do
        allow(File).to receive(:exist?).with('config/cas.yml').and_return(true)
      end
      it 'authenticates with cas' do
        expect(klass.devise_modules).to include(:cas_authenticatable)
      end
    end

    context 'when cas.yml does not exist' do
      before do
        allow(File).to receive(:exist?).with('config/cas.yml').and_return(false)
      end
      it 'authenticates with devise' do
        expect(klass.devise_modules).to include(:database_authenticatable)
      end
    end
  end

  describe '.cas?' do
    context 'when cas.yml file exists' do
      it 'returns true' do
        allow(File).to receive(:exist?).with('config/cas.yml').and_return(true)

        expect(described_class.cas?).to eq true
      end
    end

    context 'when cas.yml does not exist' do
      it 'returns false' do
        allow(File).to receive(:exist?).with('config/cas.yml').and_return(false)

        expect(described_class.cas?).to eq false
      end
    end
  end
end
