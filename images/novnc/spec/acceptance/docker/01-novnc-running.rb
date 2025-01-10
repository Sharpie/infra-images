require 'spec_helper_docker'

context 'noVNC Installation' do
  before :context do
    set :docker_container, 'novnc-test'
  end

  describe port(8000) do
    it { should be_listening }
  end
end
