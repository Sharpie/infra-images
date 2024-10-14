require 'spec_helper_kubernetes'

context 'NFS Client' do
  before :context do
    set :k8s_resource, 'test/deployment/nfs-client'
  end

  describe host('nfs.storage.svc.cluster.local') do
    it { should be_resolvable }
    it { should be_reachable.with(port: 2049) }
  end

  describe file('/mnt/hello') do
    its(:content) { should match /Hello, world!/ }
  end
end
