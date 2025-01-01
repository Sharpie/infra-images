require 'spec_helper_docker'

context 'Restic Installation' do
  before :context do
    set :docker_container, 'restic-test'
  end

  describe command('restic version') do
    its(:exit_status) { should eq 0 }
  end

  describe command('rest-server --version') do
    its(:exit_status) { should eq 0 }
  end
end
