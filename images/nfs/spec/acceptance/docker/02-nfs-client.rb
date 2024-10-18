require 'spec_helper_docker'

context 'NFS Client' do
  before :context do
    set :docker_container, 'nfs-client'
  end

  after :context do
    host_inventory.backend.run_command('umount -l /mnt')
  end

  describe host('nfs-server') do
    it { should be_resolvable }
    it { should be_reachable.with(port: 2049) }
  end

  describe command('mount -t nfs4 nfs-server:/ /mnt') do
    its(:exit_status) { should eq 0 }
  end

  describe file('/mnt/hello') do
    its(:content) { should match /Hello, world!/ }
  end
end
