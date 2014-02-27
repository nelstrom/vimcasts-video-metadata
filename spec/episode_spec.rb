gem 'minitest'
require 'minitest/autorun'
require './lib/episode'

describe Episode do
  it 'has a root directory' do
    assert_equal 'spec/videos/1', Episode.new('spec/videos/1').root
    assert_equal 'spec/videos/1', Episode.new('spec/videos/1/').root
  end

  it 'creates a VideoFile for each media file beneath root' do
    assert_equal 2, Episode.new('spec/videos/1').video_files.size
  end

  it 'has a number' do
    assert_equal "1", Episode.new('spec/videos/1').number
    assert_equal "2", Episode.new('spec/videos/2').number
  end
end
