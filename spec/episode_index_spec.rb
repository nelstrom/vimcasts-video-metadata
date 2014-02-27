gem 'minitest'
require 'minitest/autorun'
require './lib/episode_index'

describe EpisodeIndex do
  it 'has a root directory' do
    assert_equal 'spec/videos', EpisodeIndex.new('spec/videos').root
    assert_equal 'spec/videos', EpisodeIndex.new('spec/videos/').root
  end

  it 'creates an Episode for each numbered subdirectory beneath root' do
    assert_equal 5, EpisodeIndex.new('spec/videos').episodes.size
  end

  it 'writes its data to an index.json file' do
    EpisodeIndex.new('spec/videos').write_json
    assert File.exist?('spec/videos/index.json')
  end

  it 'creates an index as a hash' do
    index = EpisodeIndex.new('spec/videos').index
    assert_equal([1, 2, 3, 4, 5].map(&:to_s), index.keys)
  end

  it 'creates an index as a hash' do
    episode_one = {
      duration: 172,
      quicktime: {
        url: "http://media.vimcasts.org/videos/1/show_invisibles.m4v",
        size: 7498364
      },
      ogg: {
        url: "http://media.vimcasts.org/videos/1/show_invisibles.ogv",
        size: 5036160
      }
    }
    assert_equal episode_one, EpisodeIndex.new('spec/videos').index["1"]
    assert_equal episode_one, EpisodeIndex.new('spec/videos/').index["1"]
  end

end
