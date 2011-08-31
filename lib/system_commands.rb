require 'shellwords'

module SystemCommands
  def system!(cmd)
    ok = system(cmd)
    raise "Command `#{cmd}` failed with status #{$?.inspect}" if !ok
  end
  
  def mk_command(*args)
    cmd_parts = args.flatten
    cmd_parts.map {|arg| Shellwords.escape(arg.to_s) }.join(' ')
  end
end
