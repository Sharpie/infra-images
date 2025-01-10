require 'spec_helper_docker'

context 'noVNC Installation' do
  before :context do
    set :docker_container, 'novnc-test'
  end

  describe port(8000) do
    pending "SupervisorD takes a while to spin up, there is a race condition to solve here."
    it { should be_listening }
  end
end
