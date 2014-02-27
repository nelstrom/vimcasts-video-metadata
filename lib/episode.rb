require './lib/video_file'

class Episode
  attr_reader :root, :video_files
  def initialize(root)
    return unless Dir.exist?(root)
    @root = root.sub(/\/$/, '')
    @video_files = []
    Dir.glob("#{@root}/*").select { |i| File.exist?(i) }.map do |file|
      @video_files << VideoFile.new(file)
    end
  end

  def number
    root.scan(/\d/).first
  end

  def duration
    @video_files.map(&:duration).sort.min
  end
end
