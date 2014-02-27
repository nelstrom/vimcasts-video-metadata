class VideoFile
  attr_reader :path, :duration

  def initialize(path)
    @path = path
    @duration = calculate_duration
  end

  def url
    path.sub('spec', 'http://media.vimcasts.org')
  end

  def name
    File.extname(path) == '.m4v' ? :quicktime : :ogg
  end

  def size
    File.size(path)
  end

  def calculate_duration
    metadata = ffprobe
    duration = metadata.split(',').first
    _label, _hours, minutes, seconds = duration.split(':')
    minutes.to_i * 60 + seconds.to_i
  end

  private

  def ffprobe
    # Example output:
    #   Duration: 00:02:52.01, start: 0.000000, bitrate: 234 kb/s
    `ffprobe #{path} 2>&1 | grep Duration:`.strip
  end
end
