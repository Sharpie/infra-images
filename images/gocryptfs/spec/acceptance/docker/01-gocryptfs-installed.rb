require 'spec_helper_docker'

context 'Restic Installation' do
  before :context do
    set :docker_container, 'gocryptfs-test'
  end

  describe command('gocryptfs --version') do
    its(:exit_status) { should eq 0 }
  end
end
