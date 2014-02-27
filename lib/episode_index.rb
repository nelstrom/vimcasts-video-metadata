require './lib/episode'
require 'json'

class EpisodeIndex
  attr_reader :root, :episodes
  def initialize(root)
    return unless Dir.exist?(root)
    @root = root.sub(/\/$/, '')
    @episodes = []
    Dir.glob("#{@root}/*").select { |i| Dir.exist?(i) }.map do |dir|
      @episodes << Episode.new(dir)
    end
  end

  def write_json
    File.open("#{root}/index.json", 'w') do |f|
      f.write(JSON.pretty_generate(index))
    end
  end

  def index
    Hash.new.tap do |hash|
      episodes.each do |episode|
        hash[episode.number] = { duration: episode.duration }
        episode.video_files.each do |video|
          hash[episode.number][video.name] = {
            url: video.url,
            size: video.size
          }
        end
      end
    end
  end
end
