require 'net/http'

module Utils
  def ping(host)
    Net::Ping::External.new(host).ping?
  end

  def shell(command)
    `#{command}`
    $? == 0
  end

  def http_ok?(url)
    Net::HTTP.get_response(URI.parse(url.to_s)).code.to_i == 200
  rescue
    false
  end
end