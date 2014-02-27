gem 'minitest'
require 'minitest/autorun'
require './lib/video_file'

describe VideoFile do

  it 'has a file path' do
    assert_equal 'spec/videos/1/show_invisibles.ogv', VideoFile.new('spec/videos/1/show_invisibles.ogv').path
    assert_equal 'spec/videos/1/show_invisibles.m4v', VideoFile.new('spec/videos/1/show_invisibles.m4v').path
  end

  it 'has a url' do
    assert_equal 'http://media.vimcasts.org/videos/1/show_invisibles.m4v', VideoFile.new('spec/videos/1/show_invisibles.m4v').url
    assert_equal 'http://media.vimcasts.org/videos/1/show_invisibles.ogv', VideoFile.new('spec/videos/1/show_invisibles.ogv').url
  end
  it 'has a name' do
    assert_equal :quicktime, VideoFile.new('spec/videos/1/show_invisibles.m4v').name
    assert_equal :ogg, VideoFile.new('spec/videos/1/show_invisibles.ogv').name
  end
  it 'has a size' do
    assert_equal 7498364, VideoFile.new('spec/videos/1/show_invisibles.m4v').size
    assert_equal 5036160, VideoFile.new('spec/videos/1/show_invisibles.ogv').size
  end
end
