require 'spec_helper_docker'

context 'NFS Server' do
  before :context do
    set :docker_container, 'nfs-server'
  end

  describe service('nfs-mountd') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(2049) do
    it { should be_listening }
  end

  describe command('exportfs -s') do
    its(:stdout) { should match /\/data\s+\*/ }
  end

  describe file('/data/hello') do
    its(:content) { should match /Hello, world!/ }
  end
end
