require 'spec_helper_docker'

context 'Headscale Server' do
  before :context do
    set :docker_container, 'headscale-server'
  end

  describe command('headscale version') do
    its(:exit_status) { should eq 0 }
  end

  describe port(8080) do
    it { should be_listening }
  end
end
