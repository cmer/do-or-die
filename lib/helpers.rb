module Helpers
  def is_shell_command?(payload)
    payload =~ /^~|^\/|^\./
  end

  def check_name(c)
    c['name'] ? c['name'] : c['check']
  end

  def run_command!(payload)
    return nil unless payload
    if is_shell_command?(payload)
      `#{payload}`
      $? == 0
    else
      !!(Kernel.eval(payload))
    end
  end

  def log_and_run!(log_prefix, payload)
    payload = payload.to_s.strip

    print log_prefix

    if payload != ''
      print ": running `#{payload}`\n"
      run_command!(payload)
    else
      print "!\n"
    end
  end
end