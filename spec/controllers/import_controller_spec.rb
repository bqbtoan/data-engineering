require 'spec_helper'

describe ImportController do
  describe 'POST create' do
    it 'processes an uploaded file' do
      upload = fixture_file_upload '/example_input.tab', 'text/html'
      class << upload
        attr_reader :tempfile
      end

      OrdersImporter.stub(:run!).with(upload.tempfile)

      post :create, file: upload
      response.should be_success
    end
  end
end