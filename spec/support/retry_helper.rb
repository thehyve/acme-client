module RetryHelper
  def retry_until(options)
    options[:retry_count] ||= 3
    count = 0
    until options[:condition].call
      yield
      raise 'timed out' if count > options[:retry_count]
      count = + 1
    end
  end
end
