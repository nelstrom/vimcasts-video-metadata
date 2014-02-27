gem 'minitest'
require 'minitest/autorun'

describe 'index_videos' do
  it 'creates a index.json file at the specified loction' do
    system '../bin/index_videos spec/videos/'
    assert File.exist?('spec/videos/index.json')
  end
end
