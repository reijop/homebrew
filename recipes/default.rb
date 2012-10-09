directory "/usr/local" do
    owner ENV['SUDO_USER']
    group "wheel"
    recursive true
end

execute "install homebrew" do
    user ENV['SUDO_USER']
    group "wheel"
  command "curl -sfL https://github.com/mxcl/homebrew/tarball/master | tar zx -m --strip 1"
  cwd "/usr/local"
  not_if { File.exist? '/usr/local/bin/brew' }
end

package 'git'

execute "update homebrew from github" do
    user ENV['SUDO_USER']
    group "wheel"
    command "/usr/local/bin/brew update || true"
end
